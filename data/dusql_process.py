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
        # 清理翻译结果，去除句号，替换点号和逗号为空格，最后用下划线连接
        en_query = result.strip(".").replace(".", " ").replace(",", " ")
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

    def get_sqlite(self):
        """
        从new_schema.jsonl文件中读取并生成SQLite数据库模式
        
        Returns:
            dict: 以数据库ID为键，包含sqlite模式、列英文名和表英文名的字典
        """
        result = {}
        # 读取new_schema.jsonl文件
        with open(os.path.join(self.home_path, "new_schema.jsonl"), "r", encoding="utf-8") as f:
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

    def trans_schema(self):
        """
        转换数据库模式，将中文字段翻译为英文
        
        Returns:
            list: 包含所有数据库模式信息的列表
        """
        # 加载数据库模式数据
        db_schema = self.load_data(os.path.join(self.home_path, "db_schema.json"))
        new_schema = []
        
        # 遍历每个数据库
        for one_db in tqdm(db_schema):
            db_id = one_db['db_id']
            table_info = {}
            column_en = {}
            table_en = {}
            
            # 处理每个列信息（从索引1开始跳过第一个）
            for i, column_info in enumerate(tqdm(one_db['column_names'][1:])):
                table_id, column_name = column_info
                # 翻译列名
                column_name_en = self.translation_service(column_name)
                column_en[column_name] = column_name_en
                column_type = one_db['column_types'][i]
                table_name = one_db['table_names'][table_id]
                # 翻译表名
                table_name_en = self.translation_service(table_name)
                table_en[table_name] = table_name_en
                # 将列信息添加到对应表中
                if table_name in table_info:
                    table_info[table_name].append([column_name, column_type])
                else:
                    table_info[table_name] = [[column_name, column_type]]
            
            # 处理外键关联信息
            foreign_keys = one_db["foreign_keys"]
            joined_info = []
            for keys in foreign_keys:
                a, b = one_db['column_names'][keys[0]], one_db['column_names'][keys[1]]
                table_name_a, column_name_a = one_db['table_names'][a[0]], a[1]
                table_name_b, column_name_b = one_db['table_names'][b[0]], b[1]
                joined_info.append(([table_name_a, column_name_a], [table_name_b, column_name_b]))
            
            # 构建完整的模式信息
            schema_info = {
                "db_id": db_id, 
                "table_info": table_info, 
                "joined_info": joined_info,
                "column_en": column_en, 
                "table_en": table_en
            }
            new_schema.append(schema_info)
        return new_schema

    def make_llm_data(self, file_name, save_name, sqlite_info_name="sqlite_info_zh.json"):
        """
        生成用于大语言模型训练的数据
        
        Args:
            file_name (str): 输入文件名
            save_name (str): 保存文件名
            sqlite_info_name (str): SQLite信息文件名，默认为"sqlite_info_zh.json"
        """
        llm_data = []
        # 加载SQLite信息
        with open(os.path.join(self.home_path, sqlite_info_name), 'r', encoding="utf-8") as f:
            sqlite_info = json.load(f)
        
        # 加载样本数据
        with open(os.path.join(self.home_path, file_name), 'r', encoding="utf-8") as f:
            samples = json.load(f)
            # 处理每个样本
            for sample in tqdm(samples):
                db_id = sample['db_id']
                question = sample['question']
                sql_query_zh = sample["sql_query"]
                sqlite_query = sqlite_info[db_id]["sqlite"]
                
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

        # 保存处理后的数据
        with open(os.path.join(self.home_path, save_name), 'w', encoding="utf-8") as fout:
            fout.writelines("\n".join([json.dumps(one, ensure_ascii=False) for one in llm_data]))


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
    translation_model_path = ""
    
    # 创建数据集处理实例
    data = DusqlDataSet(home_path, translation_model_path)
    
    # 获取SQLite模式信息并保存
    result = data.get_sqlite()
    with open(os.path.join(home_path, "sqlite_info_zh.json"), 'w', encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False)
    
    # 生成开发集和训练集数据
    data.make_llm_data("dev.json", "llm_dev_zh.json")
    data.make_llm_data("train.json", "llm_train_zh.json")