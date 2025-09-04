#!/usr/bin/env python3
"""
测试升级后的get_sqlite方法
验证中文和英文DDL生成功能
"""

import os
import sys
import json

# 添加当前目录到路径
sys.path.append(os.path.dirname(__file__))

from dusql_process import DuSQLProcessor

def test_sqlite_generation():
    """测试SQLite DDL生成功能"""
    
    # 初始化处理器
    processor = DuSQLProcessor()
    
    print("=== 测试SQLite DDL生成功能 ===\n")
    
    # 测试1：中文模式（默认）
    print("1. 测试中文模式（默认）:")
    result_zh = processor.get_sqlite("dusql/new_schema_en.jsonl", use_english=False)
    
    # 获取交通运输数据库的DDL
    if "交通运输" in result_zh:
        print("数据库: 交通运输")
        print("DDL (中文模式):")
        print(result_zh["交通运输"]["sqlite"])
        print("\n" + "="*50 + "\n")
    
    # 测试2：英文模式
    print("2. 测试英文模式:")
    result_en = processor.get_sqlite("dusql/new_schema_en.jsonl", use_english=True)
    
    # 获取交通运输数据库的DDL
    if "交通运输" in result_en:
        print("数据库: 交通运输")
        print("DDL (英文模式):")
        print(result_en["交通运输"]["sqlite"])
        print("\n" + "="*50 + "\n")
    
    # 测试3：验证字段映射
    print("3. 验证字段映射:")
    if "交通运输" in result_en:
        print("表名映射:")
        table_en = result_en["交通运输"]["table_en"]
        for zh, en in list(table_en.items())[:3]:
            print(f"  {zh} -> {en}")
        
        print("\n列名映射示例:")
        columns_en = result_en["交通运输"]["columns_en"]
        for zh, en in list(columns_en.items())[:5]:
            print(f"  {zh} -> {en}")
    
    print(f"\n✅ 测试完成！共处理了 {len(result_zh)} 个数据库")

if __name__ == "__main__":
    test_sqlite_generation()