#!/usr/bin/env python3
"""
简单的trans_schema方法测试
"""
import os
import sys
import json

# 模拟翻译服务
class MockTranslation:
    def translate(self, text):
        return f"translated_{text}"

# 模拟DuSQLProcessor的部分功能
class MockDuSQLProcessor:
    def __init__(self, data_dir, translation):
        self.data_dir = data_dir
        self.translation = translation
        print(f"[INIT] 数据目录: {data_dir}")
    
    def translation_service(self, text):
        """修复后的翻译服务方法"""
        result = self.translation.translate(text)
        return result
    
    def trans_schema(self, db_schema_path):
        """修复后的trans_schema方法"""
        print(f"[TRANS_SCHEMA] 开始转换: {db_schema_path}")
        
        schema_file = os.path.join(self.data_dir, db_schema_path)
        if not os.path.exists(schema_file):
            print(f"[ERROR] 文件不存在: {schema_file}")
            return []
        
        try:
            with open(schema_file, 'r', encoding='utf-8') as f:
                schemas = json.load(f)
            print(f"[TRANS_SCHEMA] 加载成功，类型: {type(schemas)}, 长度: {len(schemas)}")
            
            if not isinstance(schemas, list):
                print(f"[ERROR] 期望列表格式，但得到: {type(schemas)}")
                return []
            
            new_schemas = []
            for idx, db_item in enumerate(schemas):
                if not isinstance(db_item, dict):
                    print(f"[WARNING] 跳过非字典项: {type(db_item)}")
                    continue
                
                db_id = db_item.get('db_id', f'unknown_{idx}')
                print(f"[TRANS_SCHEMA] 处理数据库 {idx+1}: {db_id}")
                
                # 翻译数据库名
                db_name_en = self.translation_service(db_id)
                
                # 收集表和列信息
                table_names = db_item.get('table_names', [])
                column_names = db_item.get('column_names', [])
                column_types = db_item.get('column_types', [])
                
                table_info = {}
                for table_idx, table_name in enumerate(table_names):
                    table_name_en = self.translation_service(table_name)
                    table_info[table_name_en] = []
                
                # 处理列信息
                for col_idx, col_info in enumerate(column_names[1:], 1):
                    if len(col_info) < 2:
                        continue
                    
                    table_id, col_name = col_info
                    if table_id >= len(table_names):
                        continue
                    
                    table_name = table_names[table_id]
                    table_name_en = self.translation_service(table_name)
                    col_name_en = self.translation_service(col_name)
                    col_type = column_types[col_idx-1] if col_idx-1 < len(column_types) else 'text'
                    
                    if table_name_en in table_info:
                        table_info[table_name_en].append([col_name_en, col_type])
                
                new_schemas.append({
                    'db_id': db_name_en,
                    'table_info': table_info
                })
                
                if idx >= 2:  # 只处理前3个
                    break
            
            print(f"[TRANS_SCHEMA] 完成，共 {len(new_schemas)} 个数据库")
            return new_schemas
            
        except Exception as e:
            print(f"[ERROR] 转换失败: {e}")
            import traceback
            traceback.print_exc()
            return []

if __name__ == "__main__":
    print("=== 简单测试 ===")
    
    processor = MockDuSQLProcessor("./dusql", MockTranslation())
    result = processor.trans_schema("db_schema.json")
    
    print(f"\n最终结果: {len(result)} 个数据库")
    
    if result:
        print("第一个数据库:")
        db = result[0]
        print(f"  db_id: {db['db_id']}")
        print(f"  表数量: {len(db['table_info'])}")
        for table_name, columns in list(db['table_info'].items())[:2]:
            print(f"    {table_name}: {len(columns)} 列")