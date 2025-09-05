#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
测试SQL中英文转换功能
"""

import json
import os
from dusql_process import DusqlDataSet


def test_sql_translation():
    """测试SQL查询的中英文转换"""
    
    # 设置测试路径
    home_path = "./dusql/"
    translation_model_path = "Helsinki-NLP/opus-mt-zh-en"
    
    # 创建数据集处理实例
    data = DusqlDataSet(home_path, translation_model_path)
    
    # 测试数据
    test_sql = """
    SELECT 篮球运动员.姓名, 篮球运动员.身高 
    FROM 篮球运动员 
    WHERE 篮球运动员.年龄 > 25 
    ORDER BY 篮球运动员.身高 DESC
    """
    
    # 测试映射关系
    columns_en = {
        "姓名": "name",
        "身高": "height", 
        "年龄": "age"
    }
    
    table_en = {
        "篮球运动员": "basketball_player"
    }
    
    print("=== 测试SQL中英文转换 ===")
    print(f"原始SQL: {test_sql}")
    
    # 执行转换
    translated_sql = data.translate_sql_query(test_sql, columns_en, table_en)
    
    print(f"转换后SQL: {translated_sql}")
    print()
    
    # 验证转换结果
    expected_keywords = ["basketball_player", "name", "height", "age"]
    all_found = True
    
    for keyword in expected_keywords:
        if keyword not in translated_sql:
            print(f"❌ 缺失关键词: {keyword}")
            all_found = False
        else:
            print(f"✅ 找到关键词: {keyword}")
    
    if all_found:
        print("✅ SQL转换测试通过！")
    else:
        print("❌ SQL转换测试失败！")
    
    print()
    
    # 测试边界情况
    print("=== 测试边界情况 ===")
    
    # 空查询
    empty_result = data.translate_sql_query("", columns_en, table_en)
    print(f"空查询测试: {'✅' if empty_result == '' else '❌'}")
    
    # 无匹配
    no_match_sql = "SELECT 测试字段 FROM 测试表"
    no_match_result = data.translate_sql_query(no_match_sql, columns_en, table_en)
    print(f"无匹配测试: {'✅' if '测试字段' in no_match_result else '❌'}")
    
    # 引号包围
    quoted_sql = 'SELECT `篮球运动员`.`姓名` FROM `篮球运动员`'
    quoted_result = data.translate_sql_query(quoted_sql, columns_en, table_en)
    print(f"引号包围测试: {'✅' if 'basketball_player' in quoted_result else '❌'}")


if __name__ == '__main__':
    test_sql_translation()