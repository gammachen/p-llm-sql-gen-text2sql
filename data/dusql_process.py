# -*- coding: utf-8 -*-
"""
DuSQL数据集处理脚本
该脚本用于处理DuSQL数据集，将其转换为可用于训练的格式
包括数据加载、翻译、数据库模式处理和训练数据生成等功能
"""

import argparse
import json
import os
from tqdm import tqdm
from translation_service import Translation
from convert_schema_compatible import convert_schema_to_jsonl_compatible


class DusqlDataSet:
    """
    DuSQL数据集处理类
    负责处理DuSQL数据集，包括翻译、数据库模式生成和训练数据准备
    """

    def __init__(self, home_path, translation_model_path):
        """
        初始化DusqlDataSet实例
        
        Args:
            home_path (str): 数据集根目录路径
            translation_model_path (str): 翻译模型路径
        """
        self.home_path = home_path
        self.translation = Translation(translation_model_path)

    def translation_service(self, text):
        """
        翻译服务，将中文文本翻译为英文并格式化
        
        Args:
            text (str): 待翻译的中文文本
            
        Returns:
            str: 格式化后的英文文本（以下划线分隔）
        """
        # 调用翻译服务进行翻译
        result = self.translation.translate(text)
        
        # 处理翻译结果可能是列表的情况
        if isinstance(result, list):
            if len(result) > 0:
                translated_text = result[0]
            else:
                translated_text = str(text)  # 如果没有结果，返回原文本的字符串形式
        else:
            translated_text = str(result)
            
        # 清理翻译结果，去除句号，替换点号和逗号为空格，最后用下划线连接
        en_query = translated_text.strip(".").replace(".", " ").replace(",", " ")
        en_query = en_query.replace(" ", "_")
        return en_query

    @staticmethod
    def load_data(path):
        """
        加载JSON格式数据文件
        
        Args:
            path (str): 数据文件路径
            
        Returns:
            dict/list: 加载的数据
        """
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        return data

    def get_column_types(self, col_type):
        """
        将列类型映射为SQLite数据类型
        
        Args:
            col_type (str): 原始列类型
            
        Returns:
            str: 对应的SQLite数据类型
        """
        # 定义列类型映射字典
        type_dict = {
            "number": "INTEGER", 
            "text": "VARCHAR(50)", 
            "binary": "BINARY", 
            "time": "DATETIME",
            "data": "DATETIME"
        }

        # 如果类型在字典中则返回对应类型，否则默认为VARCHAR(50)
        if col_type in type_dict:
            return type_dict[col_type]
        return "VARCHAR(50)"

    def get_sqlite(self, new_schema_path: str = "new_schema.jsonl"):
        """
        从new_schema.jsonl文件中读取并生成SQLite数据库模式
        
        Returns:
            dict: 以数据库ID为键，包含sqlite模式、列英文名和表英文名的字典
        """
        result = {}
        # 读取new_schema.jsonl文件
        with open(os.path.join(self.home_path, new_schema_path), "r", encoding="utf-8") as f:
            for line in f:
                whole_sql_info = []
                sample = json.loads(line)
                db_id = sample["db_id"]
                columns_en = sample['column_en']
                table_en = sample['table_en']
                joined_info = sample['joined_info']
                
                # 处理每个表的结构信息
                for table_name, columns in sample["table_info"].items():
                    is_first = True
                    # 构建CREATE TABLE语句头部
                    table_info = f"CREATE TABLE {table_name} "
                    column_info = []
                    # 处理每个列的信息
                    for column in columns:
                        column_name_zh, column_type = column
                        column_name_en = columns_en[column_name_zh]
                        column_name_en = " ".join(column_name_en.split("_"))
                        column_sql_type = self.get_column_types(column_type)
                        # 为第一列设置为主键
                        if is_first:
                            column_info.append(f"  {column_name_zh} {column_sql_type} PRIMARY KEY, -- {column_name_en}")
                            is_first = False
                        else:
                            column_info.append(f"  {column_name_zh} {column_sql_type}, -- {column_name_en}")
                    # 组合完整的表创建语句
                    one_table_info = table_info + "(\n" + "\n".join(column_info) + "\n);"
                    whole_sql_info.append(one_table_info)
                
                # 处理表之间的关联关系
                joined_part = []
                for one_join in joined_info:
                    a, b = one_join
                    table_name_zh_a, column_name_zh_a = a[0], a[1]
                    table_name_zh_b, column_name_zh_b = b[0], b[1]
                    # 添加关联关系的注释说明
                    one_join_info = f"-- {table_name_zh_a}.{column_name_zh_a} can be joined with {table_name_zh_b}.{table_name_zh_b}"
                    joined_part.append(one_join_info)
                whole_sql_info.append("\n".join(joined_part))
                # 将处理结果保存到结果字典中
                result[db_id] = {
                    "sqlite": "\n".join(whole_sql_info), 
                    "columns_en": columns_en, 
                    "table_en": table_en
                }
        return result

    def trans_schema(self, db_schema_path: str = "db_schema.json"):
        """
        转换数据库模式，将中文字段翻译为英文
        
        Returns:
            list: 包含所有数据库模式信息的列表
        """
        print(f"[DEBUG] 开始转换数据库模式，使用文件: {db_schema_path}")
        
        # 加载数据库模式数据
        db_schema_path_full = os.path.join(self.home_path, db_schema_path)
        print(f"[DEBUG] 完整文件路径: {db_schema_path_full}")
        
        if not os.path.exists(db_schema_path_full):
            print(f"[ERROR] 文件不存在: {db_schema_path_full}")
            return []
            
        db_schema = self.load_data(db_schema_path_full)
        print(f"[DEBUG] 成功加载数据库模式，数据类型: {type(db_schema)}, 长度: {len(db_schema)}")
        
        if not isinstance(db_schema, list):
            print(f"[ERROR] 期望db_schema.json是列表格式，但得到: {type(db_schema)}")
            return []
            
        new_schema = []
        
        # 遍历每个数据库
        for idx, one_db in enumerate(tqdm(db_schema, desc="处理数据库")):
            if not isinstance(one_db, dict):
                print(f"[WARNING] 跳过非字典项: {type(one_db)}")
                continue
                
            db_id = one_db.get('db_id', f'unknown_{idx}')
            print(f"[DEBUG] 处理第 {idx+1} 个数据库: {db_id}")
            
            # 调试：打印原始数据结构
            print(f"[DEBUG] 数据库 {db_id} 原始数据:")
            print(f"  - table_names: {len(one_db.get('table_names', []))} 个表")
            print(f"  - column_names: {len(one_db.get('column_names', []))} 个列")
            print(f"  - column_types: {len(one_db.get('column_types', []))} 个类型")
            print(f"  - foreign_keys: {len(one_db.get('foreign_keys', []))} 个外键")
            
            table_info = {}
            column_en = {}
            table_en = {}
            
            # 处理每个列信息（从索引1开始跳过第一个）
            column_names = one_db.get('column_names', [])
            column_types = one_db.get('column_types', [])
            
            if len(column_names) <= 1:
                print(f"[WARNING] 数据库 {db_id} 列信息不足，跳过")
                continue
                
            print(f"[DEBUG] 数据库 {db_id} 开始处理列信息...")
            
            for i, column_info_item in enumerate(tqdm(one_db['column_names'][1:], desc=f"处理列 {db_id}")):
                if len(column_info_item) < 2:
                    print(f"[WARNING] 数据库 {db_id} 列信息格式错误: {column_info_item}")
                    continue
                    
                table_id, column_name = column_info_item
                
                try:
                    # 翻译列名
                    column_name_en = self.translation_service(column_name)
                    print(f"[INFO] 翻译列名: {column_name} -> {column_name_en}")
                    column_en[column_name] = column_name_en
                    
                    # 获取列类型
                    if i < len(column_types):
                        column_type = column_types[i]
                    else:
                        print(f"[WARNING] 数据库 {db_id} 列类型索引越界: {i}")
                        column_type = "text"
                    
                    # 获取表名
                    if table_id < len(one_db['table_names']):
                        table_name = one_db['table_names'][table_id]
                    else:
                        print(f"[WARNING] 数据库 {db_id} 表名索引越界: {table_id}")
                        continue
                    
                    # 翻译表名
                    table_name_en = self.translation_service(table_name)
                    print(f"[INFO] 翻译表名: {table_name} -> {table_name_en}")
                    table_en[table_name] = table_name_en
                    
                    # 将列信息添加到对应表中
                    if table_name in table_info:
                        table_info[table_name].append([column_name, column_type])
                    else:
                        table_info[table_name] = [[column_name, column_type]]
                        
                except Exception as e:
                    print(f"[ERROR] 处理数据库 {db_id} 列时出错: {e}")
                    continue
            
            print(f"[DEBUG] 数据库 {db_id} 处理外键关联信息...")
            
            # 处理外键关联信息
            foreign_keys = one_db.get("foreign_keys", [])
            joined_info = []
            
            for keys in foreign_keys:
                try:
                    if len(keys) != 2:
                        print(f"[WARNING] 数据库 {db_id} 外键格式错误: {keys}")
                        continue
                        
                    a, b = one_db['column_names'][keys[0]], one_db['column_names'][keys[1]]
                    if len(a) < 2 or len(b) < 2:
                        print(f"[WARNING] 数据库 {db_id} 外键列信息格式错误: {a}, {b}")
                        continue
                        
                    table_name_a, column_name_a = one_db['table_names'][a[0]], a[1]
                    table_name_b, column_name_b = one_db['table_names'][b[0]], b[1]
                    joined_info.append(([table_name_a, column_name_a], [table_name_b, column_name_b]))
                    
                except Exception as e:
                    print(f"[ERROR] 处理数据库 {db_id} 外键时出错: {e}")
                    continue
            
            # 构建完整的模式信息
            schema_info = {
                "db_id": db_id, 
                "table_info": table_info, 
                "joined_info": joined_info,
                "column_en": column_en, 
                "table_en": table_en
            }
            
            print(f"[DEBUG] 数据库 {db_id} 处理完成:")
            print(f"  - table_info: {len(table_info)} 个表")
            print(f"  - column_en: {len(column_en)} 个列")
            print(f"  - table_en: {len(table_en)} 个表名")
            print(f"  - joined_info: {len(joined_info)} 个关联")
            
            new_schema.append(schema_info)
            
        print(f"[DEBUG] 转换完成，共处理 {len(new_schema)} 个数据库")
        return new_schema

    def make_llm_data(self, file_name, save_name, sqlite_info_name="sqlite_info_zh.json"):
        """
        生成用于大语言模型训练的数据
        
        Args:
            file_name (str): 输入文件名
            save_name (str): 保存文件名
            sqlite_info_name (str): SQLite信息文件名，默认为"sqlite_info_zh.json"
        """
        print(f"[DEBUG] 开始处理 {file_name}...")
        
        llm_data = []
        
        # 检查SQLite信息文件是否存在
        sqlite_info_path = os.path.join(self.home_path, sqlite_info_name)
        print(f"[DEBUG] SQLite信息文件路径: {sqlite_info_path}")
        
        if not os.path.exists(sqlite_info_path):
            print(f"[ERROR] SQLite信息文件不存在: {sqlite_info_path}")
            return
            
        # 加载SQLite信息
        try:
            with open(sqlite_info_path, 'r', encoding="utf-8") as f:
                sqlite_info = json.load(f)
            print(f"[DEBUG] 成功加载SQLite信息，包含 {len(sqlite_info)} 个数据库")
        except Exception as e:
            print(f"[ERROR] 加载SQLite信息时出错: {e}")
            return
        
        # 加载样本数据
        sample_path = os.path.join(self.home_path, file_name)
        print(f"[DEBUG] 样本数据文件路径: {sample_path}")
        
        if not os.path.exists(sample_path):
            print(f"[ERROR] 样本数据文件不存在: {sample_path}")
            return
            
        try:
            with open(sample_path, 'r', encoding="utf-8") as f:
                samples = json.load(f)
            print(f"[DEBUG] 成功加载样本数据，共 {len(samples)} 个样本")
        except Exception as e:
            print(f"[ERROR] 加载样本数据时出错: {e}")
            return
        
        # 处理每个样本
        missing_dbs = []
        processed_count = 0
        
        for sample_idx, sample in enumerate(tqdm(samples, desc=f"处理 {file_name}")):
            try:
                db_id = sample['db_id']
                question = sample['question']
                sql_query_zh = sample.get("query", "")
                
                # 检查数据库是否存在
                if db_id not in sqlite_info:
                    missing_dbs.append(db_id)
                    print(f"[WARNING] 数据库 {db_id} 在SQLite信息中不存在，跳过")
                    continue
                    
                sqlite_query = sqlite_info[db_id].get("sqlite", "")
                if not sqlite_query:
                    print(f"[WARNING] 数据库 {db_id} 的SQLite查询为空，跳过")
                    continue
                
                # 调试：打印处理信息
                if sample_idx < 3:  # 只打印前3个样本
                    print(f"[DEBUG] 处理样本 {sample_idx+1}:")
                    print(f"  - db_id: {db_id}")
                    print(f"  - question: {question[:50]}...")
                    print(f"  - sqlite_query长度: {len(sqlite_query)}")
                
                # 构建提示模板
                prompt = f"""### Instructions:
Your task is convert a question into a SQL query, given a Postgres database schema.
Adhere to these rules:
- **Deliberately go through the question and database schema word by word** to appropriately answer the question
- **Use Table Aliases** to prevent ambiguity. For example, `SELECT table1.col1, table2.col1 FROM table1 JOIN table2 ON table1.id = table2.id`.
- When creating a ratio, always cast the numerator as float

### Input:
Generate a SQL query that answers the question `{question}`.
This query will run on a database whose schema is represented in this string:
{sqlite_query}

### Response:
Based on your instructions, here is the SQL query I have generated to answer the question `{question}`:
```sql
"""

                output = sql_query_zh
                # 将输入输出对添加到训练数据中
                llm_data.append({
                    "input": prompt,
                    "output": output
                })
                processed_count += 1
                
            except Exception as e:
                print(f"[ERROR] 处理样本 {sample_idx+1} 时出错: {e}")
                continue

        print(f"[DEBUG] 处理完成: 共 {processed_count} 个样本成功处理")
        if missing_dbs:
            print(f"[WARNING] 缺失的数据库: {set(missing_dbs)} (共 {len(set(missing_dbs))} 个)")

        # 保存处理后的数据
        save_path = os.path.join(self.home_path, save_name)
        try:
            with open(save_path, 'w', encoding="utf-8") as fout:
                fout.writelines("\n".join([json.dumps(one, ensure_ascii=False) for one in llm_data]))
            print(f"[DEBUG] 成功保存处理后的数据到: {save_path}")
            print(f"[DEBUG] 保存了 {len(llm_data)} 个训练样本")
        except Exception as e:
            print(f"[ERROR] 保存数据时出错: {e}")


def parse_args():
    """
    解析命令行参数
    
    Returns:
        argparse.Namespace: 解析后的命令行参数
    """
    parser = argparse.ArgumentParser(description='DuSQL数据处理脚本')
    parser.add_argument('--sql_home_path', type=str, default="./dusql/", help='DuSQL数据保存地址')
    parser.add_argument('--translation_model_path', type=str, default="", help='翻译模型地址')
    return parser.parse_args()


if __name__ == '__main__':
    # 设置默认路径
    home_path = "./dusql/"
    translation_model_path = "Helsinki-NLP/opus-mt-zh-en"
    
    # 创建数据集处理实例
    data = DusqlDataSet(home_path, translation_model_path)

    # 调用convert_schema_compatible方法将new_schema_en.json转换为符合get_sqlite方法期望的JSONL格式
    convert_schema_to_jsonl_compatible(os.path.join(home_path, "db_schema.json"), os.path.join(home_path, "db_schema.jsonl"))
    
    # 获取SQLite模式信息并保存(db_schema.jsonl是原始的中文格式，sqlite_info_zh.json是中文的SQLite模式信息)
    result = data.get_sqlite("db_schema.jsonl")
    with open(os.path.join(home_path, "sqlite_info_zh.json"), 'w', encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False)
    
    # 调用translate方法对db_schema.json进行中英文转换并保存(new_schema_en.json是英文的模式信息)
    new_schema_en = data.trans_schema(db_schema_path="db_schema.json")
    with open(os.path.join(home_path, "new_schema_en.json"), 'w', encoding="utf-8") as f:
        json.dump(new_schema_en, f, ensure_ascii=False)
    
    
    # 生成开发集和训练集数据
    data.make_llm_data("dev.json", "llm_dev_zh.json", sqlite_info_name="sqlite_info_zh.json")
    data.make_llm_data("train.json", "llm_train_zh.json", sqlite_info_name="sqlite_info_zh.json")
    
    # # 调用convert_schema_compatible方法将new_schema_en.json转换为符合get_sqlite方法期望的JSONL格式
    # convert_schema_to_jsonl_compatible(os.path.join(home_path, "new_schema_en.json"), os.path.join(home_path, "new_schema_en.jsonl"))
    
    # # 获取SQLite模式信息并保存
    # result = data.get_sqlite("new_schema_en.jsonl")
    # with open(os.path.join(home_path, "sqlite_info_en.json"), 'w', encoding="utf-8") as f:
    #     json.dump(result, f, ensure_ascii=False)
    
    # # 生成英文的开发集和训练集数据
    # data.make_llm_data("dev.json", "llm_dev_en.json", sqlite_info_name="sqlite_info_en.json")
    # data.make_llm_data("train.json", "llm_train_en.json", sqlite_info_name="sqlite_info_en.json")