"""
DeepSeek Coder模型微调脚本
该脚本用于使用LoRA技术对DeepSeek Coder模型进行微调，实现从自然语言到SQL语句的生成任务
"""

import copy
import random
from dataclasses import dataclass, field
from typing import Optional, Dict, Sequence

import torch
import torch.distributed
import transformers
from transformers import Trainer
from datasets import load_dataset

from peft import (
    TaskType,
    LoraConfig,
    get_peft_model,
    set_peft_model_state_dict,
    # prepare_model_for_kbit_training
)
from peft.utils import TRANSFORMERS_MODELS_TO_LORA_TARGET_MODULES_MAPPING

# 定义忽略标记的索引值，用于在计算损失时忽略特定位置
IGNORE_INDEX = -100
# 定义结束标记，表示生成的结束
EOT_TOKEN = "<|EOT|>"


def build_instruction_prompt(instruction: str):
    """
    构建指令提示模板
    
    Args:
        instruction (str): 用户输入的指令文本
        
    Returns:
        str: 格式化后的指令提示模板
    """
    return '''
You are an AI programming assistant, utilizing the DeepSeek Coder model, developed by DeepSeek Company, and you only answer questions related to computer science. For politically sensitive questions, security and privacy issues, and other non-computer science questions, you will refuse to answer.
### Instruction:
{}
### Response:
'''.format(instruction.strip()).lstrip()


@dataclass
class ModelArguments:
    """模型相关参数配置"""
    # 预训练模型路径
    model_name_or_path: Optional[str] = field(
        default="/data/public_pretrain_models/deepseek-coder-1.3b-base"
    )
    # output_dir: Optional[str] = field(default="../output/")


@dataclass
class DataArguments:
    """数据相关参数配置"""
    # 训练数据路径
    data_path: str = field(
        default="../data/dusql/llm_train_en.json", 
        metadata={"help": "Path to the training data."}
    )


@dataclass
class TrainingArguments(transformers.TrainingArguments):
    """训练相关参数配置"""
    # 缓存目录
    cache_dir: Optional[str] = field(default=None)
    # 优化器类型
    optim: str = field(default="adamw_torch")
    # 模型最大序列长度
    model_max_length: int = field(
        default=2048,
        metadata={"help": "Maximum sequence length. Sequences will be right padded (and possibly truncated)."},
    )


def safe_save_model_for_hf_trainer(trainer: transformers.Trainer, output_dir: str):
    """
    安全保存模型状态字典到磁盘
    
    Args:
        trainer (transformers.Trainer): 训练器实例
        output_dir (str): 模型保存目录
    """
    # 获取模型状态字典
    state_dict = trainer.model.state_dict()
    # 仅在主进程上保存模型
    if trainer.args.should_save:
        # 将状态字典转移到CPU上以节省GPU内存
        cpu_state_dict = {key: value.cpu() for key, value in state_dict.items()}
        # 删除原始状态字典以释放内存
        del state_dict
        # 保存模型到指定目录
        trainer._save(output_dir, state_dict=cpu_state_dict)  # noqa


def _tokenize_fn(strings: Sequence[str], tokenizer: transformers.PreTrainedTokenizer) -> Dict:
    """
    对字符串列表进行tokenize处理
    
    Args:
        strings (Sequence[str]): 待处理的字符串序列
        tokenizer (transformers.PreTrainedTokenizer): 分词器
        
    Returns:
        Dict: 包含input_ids、labels及长度信息的字典
    """
    # 对每个字符串进行分词处理
    tokenized_list = [
        tokenizer(
            text,
            return_tensors="pt",
            padding="longest",
            max_length=tokenizer.model_max_length,
            truncation=True,
        )
        for text in strings
    ]

    # 提取input_ids作为输入和标签
    input_ids = labels = [tokenized.input_ids[0] for tokenized in tokenized_list]
    # 计算每个序列中非pad_token的数量
    input_ids_lens = labels_lens = [
        tokenized.input_ids.ne(tokenizer.pad_token_id).sum().item() for tokenized in tokenized_list
    ]

    return dict(
        input_ids=input_ids,
        labels=labels,
        input_ids_lens=input_ids_lens,
        labels_lens=labels_lens,
    )


def preprocess(
        sources: Sequence[str],
        targets: Sequence[str],
        tokenizer: transformers.PreTrainedTokenizer,
) -> Dict:
    """
    预处理数据，进行tokenize处理
    
    Args:
        sources (Sequence[str]): 源文本序列（输入）
        targets (Sequence[str]): 目标文本序列（输出）
        tokenizer (transformers.PreTrainedTokenizer): 分词器
        
    Returns:
        Dict: 预处理后的数据字典
    """
    # 将源文本和目标文本拼接
    examples = [s + t for s, t in zip(sources, targets)]
    # 分别对拼接后的文本和源文本进行tokenize处理
    examples_tokenized, sources_tokenized = [_tokenize_fn(strings, tokenizer) for strings in (examples, sources)]
    input_ids = examples_tokenized["input_ids"]

    # 深拷贝input_ids作为标签
    labels = copy.deepcopy(input_ids)
    # 将源文本部分的标签设置为IGNORE_INDEX，这样在计算损失时不会考虑这些位置
    for label, source_len in zip(labels, sources_tokenized["input_ids_lens"]):
        label[:source_len] = IGNORE_INDEX
    return dict(input_ids=input_ids, labels=labels)


@dataclass
class DataCollatorForSupervisedDataset(object):
    """用于监督微调的数据整理器"""
    # 分词器
    tokenizer: transformers.PreTrainedTokenizer

    def __call__(self, instances: Sequence[Dict]) -> Dict[str, torch.Tensor]:
        """
        数据整理函数，将一批样本整理为模型输入格式
        
        Args:
            instances (Sequence[Dict]): 样本实例列表
            
        Returns:
            Dict[str, torch.Tensor]: 整理后的模型输入数据
        """
        # 从实例中提取input_ids和labels
        input_ids, labels = tuple([instance[key] for instance in instances] for key in ("input_ids", "labels"))
        # 转换为tensor并进行padding
        input_ids = [torch.tensor(x) for x in input_ids]
        input_ids = torch.nn.utils.rnn.pad_sequence(
            input_ids, batch_first=True, padding_value=self.tokenizer.pad_token_id
        )
        labels = [torch.tensor(x) for x in labels]
        labels = torch.nn.utils.rnn.pad_sequence(labels, batch_first=True, padding_value=IGNORE_INDEX)

        # 返回模型输入所需的所有数据
        return dict(
            input_ids=input_ids,
            labels=labels,
            attention_mask=input_ids.ne(self.tokenizer.pad_token_id),
        )


def train_tokenize_function(examples, tokenizer):
    """
    训练数据的tokenize处理函数
    
    Args:
        examples: 训练样本
        tokenizer: 分词器
        
    Returns:
        dict: 处理后的数据字典
    """
    # 为每个输入构建指令提示
    sources = [
        build_instruction_prompt(instruction)
        for instruction in examples['input']
    ]
    # 为目标输出添加结束标记
    targets = [f"{output}\n{EOT_TOKEN}" for output in examples['output']]
    # 预处理数据
    data_dict = preprocess(sources, targets, tokenizer)
    return data_dict


def train():
    """主训练函数"""
    # 解析命令行参数
    parser = transformers.HfArgumentParser((ModelArguments, DataArguments, TrainingArguments))
    model_args, data_args, training_args = parser.parse_args_into_dataclasses()

    # 仅在主进程上打印训练参数
    if training_args.local_rank == 0:
        print('=' * 100)
        print(training_args)

    # 加载分词器
    tokenizer = transformers.AutoTokenizer.from_pretrained(
        model_args.model_name_or_path,
        model_max_length=training_args.model_max_length,
        padding_side="right",
        use_fast=True,
        trust_remote_code=True
    )

    # 打印分词器特殊标记信息
    print("PAD Token:", tokenizer.pad_token, tokenizer.pad_token_id)
    print("BOS Token", tokenizer.bos_token, tokenizer.bos_token_id)
    print("EOS Token", tokenizer.eos_token, tokenizer.eos_token_id)

    # 仅在主进程上打印加载分词器完成信息
    if training_args.local_rank == 0:
        print("Load tokenizer from {} over.".format(model_args.model_name_or_path))

    # 加载预训练模型
    model = transformers.AutoModelForCausalLM.from_pretrained(
        model_args.model_name_or_path,
        torch_dtype=torch.bfloat16
    )
    print(model)

    # 配置LoRA参数
    config = LoraConfig(
        task_type=TaskType.CAUSAL_LM,          # 任务类型为因果语言模型
        target_modules=["q_proj", "v_proj"],   # 目标模块为注意力机制中的q和v投影层
        inference_mode=False,                  # 训练模式
        r=8,                                   # LoRA秩
        lora_alpha=32,                         # LoRA缩放因子
        lora_dropout=0.1                       # Dropout比例
    )
    # 使用LoRA配置包装模型
    model = get_peft_model(model, config)

    # 仅在主进程上打印加载模型完成信息
    if training_args.local_rank == 0:
        print("Load model from {} over.".format(model_args.model_name_or_path))

    # 加载训练数据集
    raw_train_datasets = load_dataset(
        'json',
        data_files=data_args.data_path,
        split="train",
        cache_dir=training_args.cache_dir
    )
    
    # 多GPU训练时进行同步
    if training_args.local_rank > 0:
        torch.distributed.barrier()

    # 对训练数据进行预处理
    train_dataset = raw_train_datasets.map(
        train_tokenize_function,
        batched=True,
        batch_size=3000,
        num_proc=32,
        remove_columns=raw_train_datasets.column_names,
        load_from_cache_file=True,  # not args.overwrite_cache
        desc="Running Encoding",
        fn_kwargs={"tokenizer": tokenizer}
    )

    # 创建数据整理器
    data_collator = DataCollatorForSupervisedDataset(tokenizer=tokenizer)
    # 构建训练数据模块
    data_module = dict(train_dataset=train_dataset, eval_dataset=None, data_collator=data_collator)

    # 创建训练器
    trainer = Trainer(model=model, tokenizer=tokenizer, args=training_args, **data_module)

    # 开始训练
    trainer.train()
    # 保存训练状态
    trainer.save_state()
    # 保存模型
    safe_save_model_for_hf_trainer(trainer=trainer, output_dir=training_args.output_dir)


if __name__ == "__main__":
    train()