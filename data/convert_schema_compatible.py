#!/usr/bin/env python3
"""
兼容的 JSON 转 JSONL 转换器
支持处理不同结构的 JSON 文件，包括 db_schema.json 和 new_schema.json
"""

import json
import os

def convert_schema_to_jsonl_compatible(input_path, output_path):
    """
    兼容的转换函数，处理不同结构的 JSON 文件
    """
    
    # 读取原始 JSON 文件
    with open(input_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # 处理每个数据库
    jsonl_lines = []
    
    for db_info in data:
        db_id = db_info['db_id']
        
        try:
            # 检查数据结构类型
            if 'table_info' in db_info and 'column_en' in db_info and 'table_en' in db_info:
                # 处理 new_schema_en.json 格式
                print(f"[INFO] 处理 new_schema_en 格式: {db_id}")
                
                new_structure = {
                    'db_id': db_id,
                    'column_en': db_info.get('column_en', {}),
                    'table_en': db_info.get('table_en', {}),
                    'joined_info': db_info.get('joined_info', []),
                    'table_info': db_info.get('table_info', {})
                }
                
            else:
                # 处理原始 db_schema.json 格式
                print(f"[INFO] 处理原始 db_schema 格式: {db_id}")
                
                # 构建新的 JSON 结构
                new_structure = {
                    'db_id': db_id,
                    'column_en': {},
                    'table_en': {},
                    'joined_info': [],
                    'table_info': {}
                }
                
                # 处理表名映射
                table_names = db_info['table_names']
                
                # 兼容处理：优先使用 table_names_original，如果没有则使用 table_names
                if 'table_names_original' in db_info:
                    table_names_original = db_info['table_names_original']
                else:
                    table_names_original = table_names
                
                # 构建表名映射（中文到英文）
                for zh_name, en_name in zip(table_names_original, table_names):
                    new_structure['table_en'][zh_name] = en_name
                
                # 处理列信息
                column_names = db_info['column_names']
                column_types = db_info['column_types']
                
                # 兼容处理：优先使用 column_names_original，如果没有则使用 column_names
                if 'column_names_original' in db_info:
                    column_names_original = db_info['column_names_original']
                else:
                    column_names_original = column_names
                
                # 构建列名映射和表结构
                for i, (col_info, col_info_orig) in enumerate(zip(column_names, column_names_original)):
                    if col_info[0] == -1:  # 跳过通配符列
                        continue
                        
                    table_idx = col_info[0]
                    
                    # 确保表索引有效
                    if table_idx >= len(table_names_original):
                        continue
                        
                    table_name_zh = table_names_original[table_idx]
                    column_name_zh = col_info_orig[1]
                    column_name_en = col_info[1]
                    column_type = column_types[i]
                    
                    # 添加到列名映射
                    new_structure['column_en'][column_name_zh] = column_name_en
                    
                    # 添加到表结构
                    if table_name_zh not in new_structure['table_info']:
                        new_structure['table_info'][table_name_zh] = []
                    
                    new_structure['table_info'][table_name_zh].append([column_name_zh, column_type])
                
                # 处理外键关系作为 joined_info
                foreign_keys = db_info.get('foreign_keys', [])
                for fk in foreign_keys:
                    if len(fk) != 2:
                        continue
                        
                    col_idx1, col_idx2 = fk
                    
                    # 确保列索引有效
                    if col_idx1 >= len(column_names) or col_idx2 >= len(column_names):
                        continue
                    
                    # 获取列信息
                    table_idx1 = column_names[col_idx1][0]
                    table_idx2 = column_names[col_idx2][0]
                    
                    # 确保表索引有效
                    if table_idx1 >= len(table_names_original) or table_idx2 >= len(table_names_original):
                        continue
                    
                    table_name_zh1 = table_names_original[table_idx1]
                    table_name_zh2 = table_names_original[table_idx2]
                    
                    col_name_zh1 = column_names_original[col_idx1][1]
                    col_name_zh2 = column_names_original[col_idx2][1]
                    
                    # 构建关联关系
                    new_structure['joined_info'].append([
                        [table_name_zh1, col_name_zh1],
                        [table_name_zh2, col_name_zh2]
                    ])
            
            # 添加到 JSONL 行
            jsonl_lines.append(json.dumps(new_structure, ensure_ascii=False))
            
        except Exception as e:
            print(f"处理数据库 {db_id} 时出错: {e}")
            import traceback
            traceback.print_exc()
            continue
    
    # 写入 JSONL 文件
    with open(output_path, 'w', encoding='utf-8') as f:
        for line in jsonl_lines:
            f.write(line + '\n')
    
    print(f"转换完成！共处理了 {len(jsonl_lines)} 个数据库")
    print(f"输出文件: {output_path}")
    
    return len(jsonl_lines)

def main():
    """主函数"""
    
    # 支持的文件列表
    files_to_convert = [
        ("/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/new_schema_en.json", "/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/new_schema_en.jsonl"),
        ("/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/new_schema.json", "/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/new_schema.jsonl"),
        ("/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/db_schema.json", "/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/dusql/db_schema.jsonl"),
        ("/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/cspider/db_schema.json", "/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/cspider/db_schema.jsonl"),
        ("/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/nl2sql/db_schema.json", "/Users/shhaofu/Code/cursor-projects/p-llm-sql-gen-text2sql/data/nl2sql/db_schema.jsonl"),
    ]
    
    for input_file, output_file in files_to_convert:
        if os.path.exists(input_file):
            print(f"\n处理文件: {input_file}")
            try:
                count = convert_schema_to_jsonl_compatible(input_file, output_file)
                print(f"成功转换 {count} 个数据库")
            except Exception as e:
                print(f"转换失败: {e}")
        else:
            print(f"文件不存在: {input_file}")

if __name__ == "__main__":
    main()