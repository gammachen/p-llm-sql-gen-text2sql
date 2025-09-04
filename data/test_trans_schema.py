#!/usr/bin/env python3
"""
测试trans_schema方法的逻辑
"""
import os
import sys
import json
import logging

# 设置日志级别为DEBUG
logging.basicConfig(level=logging.DEBUG)

# 模拟翻译服务
class MockTranslation:
    def translate(self, text):
        print(f"[MOCK_TRANSLATE] 翻译文本: {text}")
        return [f"translated_{text}"]

# 模拟DuSQLProcessor的部分功能
class MockDuSQLProcessor:
    def __init__(self, data_dir, translation):
        self.data_dir = data_dir
        self.translation = translation
        print(f"[INIT] 初始化处理器，数据目录: {data_dir}")
    
    def translation_service(self, text):
        """修复后的翻译服务方法"""
        print(f"[TRANSLATION_SERVICE] 调用翻译服务: {text}")
        result = self.translation.translate(text)
        print(f"[TRANSLATION_SERVICE] 原始结果: {result}, 类型: {type(result)}")
        
        if isinstance(result, list):
            if len(result) == 0:
                print("[TRANSLATION_SERVICE] 警告: 翻译结果为空列表，使用原文本")
                return text
            translated_text = result[0]
            print(f"[TRANSLATION_SERVICE] 使用列表第一个元素: {translated_text}")
        elif isinstance(result, str):
            translated_text = result
            print(f"[TRANSLATION_SERVICE] 使用字符串结果: {translated_text}")
        elif result is None:
            print("[TRANSLATION_SERVICE] 警告: 翻译结果为None，使用原文本")
            translated_text = text
        else:
            print(f"[TRANSLATION_SERVICE] 警告: 未知类型 {type(result)}，使用原文本")
            translated_text = text
        
        print(f"[TRANSLATION_SERVICE] 最终结果: {translated_text}")
        return translated_text
    
    def trans_schema(self, db_schema_path):
        """修复后的trans_schema方法，带有详细调试信息"""
        print(f"[TRANS_SCHEMA] 开始转换模式，路径: {db_schema_path}")
        
        schema_file = os.path.join(self.data_dir, db_schema_path)
        print(f"[TRANS_SCHEMA] 完整文件路径: {schema_file}")
        
        if not os.path.exists(schema_file):
            print(f"[ERROR] 文件不存在: {schema_file}")
            return []
        
        file_size = os.path.getsize(schema_file)
        print(f"[TRANS_SCHEMA] 文件大小: {file_size} 字节")
        
        if file_size == 0:
            print("[WARNING] 文件为空")
            return []
        
        try:
            with open(schema_file, 'r', encoding='utf-8') as f:
                schemas = json.load(f)
            print(f"[TRANS_SCHEMA] 成功加载JSON，共 {len(schemas)} 个数据库")
            
            if not schemas:
                print("[WARNING] 加载的数据为空")
                return []
            
            # 打印前几个数据库的信息
            for i, (db_id, db_info) in enumerate(list(schemas.items())[:3]):
                print(f"[TRANS_SCHEMA] 数据库 {i+1}: {db_id}")
                print(f"  表数量: {len(db_info.get('table_names_original', []))}")
                print(f"  列数量: {len(db_info.get('column_names_original', []))}")
            
            # 处理列表格式的数据
            if isinstance(schemas, list):
                print("[DEBUG] 处理列表格式的数据库数据")
                new_schemas = []
                
                for idx, db_item in enumerate(schemas):
                    if not isinstance(db_item, dict):
                        print(f"[WARNING] 跳过非字典项: {type(db_item)}")
                        continue
                    
                    db_id = db_item.get('db_id', f'unknown_{idx}')
                    print(f"[DEBUG] 处理数据库 {idx+1}/{len(schemas)}: {db_id}")
                    
                    # 翻译数据库名
                    db_name_en = self.translation_service(db_id)
                    print(f"[DEBUG] 数据库 {db_id} -> {db_name_en}")
                    
                    table_info = []
                    table_names = db_item.get('table_names', [])
                    column_names = db_item.get('column_names', [])
                    column_types = db_item.get('column_types', [])
                    
                    print(f"[DEBUG] 数据库 {db_id} 有 {len(table_names)} 个表")
                    
                    # 处理每个表
                    for table_idx, table_name in enumerate(table_names):
                        table_name_en = self.translation_service(table_name)
                        print(f"[DEBUG] 表 {table_name} -> {table_name_en}")
                        
                        columns = []
                        # 处理每个列（跳过第一个，通常是*）
                        for col_idx, col_info in enumerate(column_names[1:], 1):
                            if len(col_info) < 2:
                                continue
                            
                            col_table_idx, col_name = col_info
                            if col_table_idx == table_idx:
                                col_name_en = self.translation_service(col_name)
                                col_type = column_types[col_idx-1] if col_idx-1 < len(column_types) else 'text'
                                columns.append({
                                    'column_name': col_name_en,
                                    'column_type': col_type,
                                    'column_description': col_name_en
                                })
                        
                        table_info.append({
                            'table_name': table_name_en,
                            'table_description': table_name_en,
                            'columns': columns
                        })
                    
                    new_schemas.append({
                        'db_id': db_name_en,
                        'table_info': table_info
                    })
                    
                    if idx >= 2:  # 测试模式，只处理前3个
                        print("[DEBUG] 测试模式，只处理前3个数据库")
                        break
                
                print(f"[DEBUG] 转换完成，共生成 {len(new_schemas)} 个数据库")
                return new_schemas
            
        except json.JSONDecodeError as e:
            print(f"[ERROR] JSON解析错误: {e}")
            return []
        except Exception as e:
            print(f"[ERROR] 转换过程中出错: {e}")
            return []

if __name__ == "__main__":
    print("=== 测试trans_schema方法 ===")
    
    # 检查文件
    data_dir = "./dusql"
    schema_path = "db_schema.json"
    
    print(f"当前工作目录: {os.getcwd()}")
    print(f"数据目录: {data_dir}")
    print(f"模式文件: {schema_path}")
    
    # 检查文件是否存在
    full_path = os.path.join(data_dir, schema_path)
    print(f"完整路径: {full_path}")
    print(f"文件存在: {os.path.exists(full_path)}")
    
    if os.path.exists(full_path):
        print(f"文件大小: {os.path.getsize(full_path)} 字节")
        
        # 预览文件内容
        with open(full_path, 'r', encoding='utf-8') as f:
            content = f.read(200)
        print(f"文件预览: {content[:100]}...")
    
    # 创建处理器并测试
    processor = MockDuSQLProcessor(data_dir, MockTranslation())
    result = processor.trans_schema(schema_path)
    
    print(f"\n=== 最终结果 ===")
    print(f"转换结果: {len(result)} 个数据库")
    
    if result:
        print("第一个数据库详情:")
        print(json.dumps(result[0], indent=2, ensure_ascii=False))