#!/usr/bin/env python3
# asciinema-cut.py

import json
import sys
import argparse

def cut_cast(input_file, output_file, start_time, end_time):
    # 读取文件的每一行，因为这不是标准的单一 JSON 文件
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    # 第一行是头部信息
    header = json.loads(lines[0])
    
    # 后续行是事件数据
    events = []
    for line in lines[1:]:
        if line.strip():
            try:
                event = json.loads(line)
                events.append(event)
            except json.JSONDecodeError:
                # 跳过无法解析的行
                continue
    
    # 计算要删除的时间段长度
    gap = end_time - start_time
    if gap <= 0:
        raise ValueError("end_time must be greater than start_time")

    new_events = []
    for event in events:
        t = event[0]

        # 完全在删除区间之前的事件：保留
        if t < start_time:
            new_events.append(event)

        # 在删除区间之后的事件：时间前移
        elif t >= end_time:
            shifted_event = [t - gap] + event[1:]
            new_events.append(shifted_event)

        # 处于删除区间内的事件：丢弃（不加入新列表）
        else:
            pass  # skip this event

    # 保存结果 - 严格按照 asciicast 格式：第一行是头部信息，其余行是事件数据
    with open(output_file, 'w') as f:
        # 写入头部信息，只保留原始格式的必要字段
        header_only = {
            "version": header.get("version", 2),
            "width": header.get("width", 80),
            "height": header.get("height", 24),
            "timestamp": header.get("timestamp", 0),
            "env": header.get("env", {})
        }
        f.write(json.dumps(header_only, separators=(',', ':')) + '\n')
        
        # 写入处理后的事件数据（每个事件一行）
        for event in new_events:
            f.write(json.dumps(event, separators=(',', ':')) + '\n')

    print(f"✅ 已剪辑并时间对齐: {input_file}")
    print(f"   保留 {start_time}s 之前 和 {end_time}s 之后的内容")
    print(f"   时间偏移: -{gap:.2f}s")
    print(f"   保存为: {output_file}")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='剪辑 asciinema cast 文件并自动时间对齐')
    parser.add_argument('input', help='输入的 .cast 文件路径')
    parser.add_argument('output', help='输出的 .cast 文件路径')
    parser.add_argument('start', type=float, help='删除开始时间（秒）')
    parser.add_argument('end', type=float, help='删除结束时间（秒）')

    args = parser.parse_args()

    try:
        cut_cast(args.input, args.output, args.start, args.end)
    except Exception as e:
        print(f"❌ 错误: {e}")
        sys.exit(1)
