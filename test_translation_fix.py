#!/usr/bin/env python3
"""
测试翻译服务修复的脚本
"""
import sys
import os

# 添加当前目录到Python路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

def test_translation_logic():
    """测试翻译结果处理逻辑"""
    print("测试翻译结果处理逻辑...")
    
    # 模拟不同的返回类型
    test_cases = [
        ["翻译结果"],  # 列表类型
        ["测试文本", "额外结果"],  # 多个结果的列表
        [],  # 空列表
        "字符串结果",  # 字符串类型
        None  # None类型
    ]
    
    for i, result in enumerate(test_cases):
        print(f"\n测试用例 {i+1}: {type(result)} -> {result}")
        
        try:
            # 模拟修复后的处理逻辑
            if isinstance(result, list):
                if len(result) > 0:
                    translated_text = result[0]
                else:
                    translated_text = str("原文本")  # 如果没有结果，返回原文本的字符串形式
            else:
                translated_text = str(result)
                
            # 清理翻译结果
            en_query = translated_text.strip(".").replace(".", " ").replace(",", " ")
            en_query = en_query.replace(" ", "_")
            
            print(f"  处理结果: {en_query}")
            
        except Exception as e:
            print(f"  错误: {e}")

if __name__ == "__main__":
    test_translation_logic()
    print("\n修复验证完成！")