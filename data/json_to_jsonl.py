#!/usr/bin/env python3
"""
通用 JSON 转 JSONL 转换器
支持将 JSON 数组文件转换为 JSONL（每行一个 JSON）格式
"""

import json
import os
import argparse

def json_to_jsonl(input_file, output_file):
    """
    将 JSON 数组文件转换为 JSONL 格式
    
    Args:
        input_file (str): 输入的 JSON 文件路径
        output_file (str): 输出的 JSONL 文件路径
    """
    
    # 检查输入文件是否存在
    if not os.path.exists(input_file):
        raise FileNotFoundError(f"输入文件不存在: {input_file}")
    
    # 读取 JSON 文件
    with open(input_file, 'r', encoding='utf-8') as f:
        try:
            data = json.load(f)
        except json.JSONDecodeError as e:
            raise ValueError(f"JSON 解析错误: {e}")
    
    # 确保数据是列表类型
    if not isinstance(data, list):
        raise ValueError("输入的 JSON 文件必须包含一个数组")
    
    # 写入 JSONL 文件
    with open(output_file, 'w', encoding='utf-8') as f:
        for item in data:
            json_line = json.dumps(item, ensure_ascii=False)
            f.write(json_line + '\n')
    
    print(f"转换完成！")
    print(f"输入文件: {input_file}")
    print(f"输出文件: {output_file}")
    print(f"处理了 {len(data)} 个对象")

def main():
    parser = argparse.ArgumentParser(description='将 JSON 数组转换为 JSONL 格式')
    parser.add_argument('input', help='输入的 JSON 文件路径')
    parser.add_argument('-o', '--output', help='输出的 JSONL 文件路径（可选）')
    
    args = parser.parse_args()
    
    input_path = args.input
    
    # 如果没有指定输出文件，自动添加 .jsonl 后缀
    if args.output:
        output_path = args.output
    else:
        base_name = os.path.splitext(input_path)[0]
        output_path = base_name + '.jsonl'
    
    try:
        json_to_jsonl(input_path, output_path)
        
        # 验证输出文件
        with open(output_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            print(f"\n验证结果：")
            print(f"JSONL 文件总行数: {len(lines)}")
            
            if lines:
                # 尝试解析第一行
                try:
                    first_item = json.loads(lines[0])
                    print(f"第一行解析成功，包含 {len(first_item)} 个字段")
                except json.JSONDecodeError as e:
                    print(f"警告: 第一行解析失败: {e}")
                    
    except Exception as e:
        print(f"错误: {e}")
        exit(1)

if __name__ == "__main__":
    # 如果没有命令行参数，使用默认文件
    if len(os.sys.argv) == 1:
        input_file = "/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/new_schema.json"
        output_file = "/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/new_schema.jsonl"
        json_to_jsonl(input_file, output_file)
    else:
        main()