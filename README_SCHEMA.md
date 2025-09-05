# JSON 转 JSONL 转换工具

这个工具包用于将 JSON 格式的数据库模式文件转换为 JSONL（JSON Lines）格式。

## 文件说明

### 1. `convert_schema.py` - 专用转换脚本
将 `new_schema.json` 转换为符合 `get_sqlite` 方法期望的 JSONL 格式。

**使用方法：**
```bash
python convert_schema.py
```

**输入文件：** `data/dusql/new_schema.json`
**输出文件：** `data/dusql/new_schema.jsonl`

### 2. `json_to_jsonl.py` - 通用转换脚本
将任何 JSON 数组文件转换为 JSONL 格式。

**使用方法：**
```bash
# 使用默认路径
python json_to_jsonl.py

# 指定输入文件
python json_to_jsonl.py data/your_file.json

# 指定输入和输出文件
python json_to_jsonl.py data/input.json -o data/output.jsonl
```

## JSONL 格式说明

转换后的 JSONL 文件每行包含一个 JSON 对象，格式如下：

```json
{
  "db_id": "数据库名称",
  "column_en": {
    "中文字段名1": "english_field_name_1",
    "中文字段名2": "english_field_name_2"
  },
  "table_en": {
    "中文表名1": "english_table_name_1",
    "中文表名2": "english_table_name_2"
  },
  "joined_info": [
    [["表A", "字段A"], ["表B", "字段B"]],
    [["表C", "字段C"], ["表D", "字段D"]]
  ],
  "table_info": {
    "表名1": [
      ["列名1", "数据类型1"],
      ["列名2", "数据类型2"]
    ]
  }
}
```

## 数据类型映射

原始数据类型映射到标准类型：
- `text` → 文本类型
- `number` → 数值类型
- `time` → 时间类型
- `binary` → 布尔类型

## 验证结果

转换完成后，脚本会显示：
- 处理的数据库数量
- 生成的 JSONL 文件路径
- 文件总行数

## 注意事项

1. 确保输入文件是有效的 JSON 数组格式
2. 输出文件会覆盖已存在的同名文件
3. 中文字符会保留，不会被转义为 Unicode 编码