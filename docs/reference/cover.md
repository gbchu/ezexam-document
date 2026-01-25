# `cover` 方法 <Badge type="warning" text="0.2.0" />

该方法可生成一个封面

#### 示例
```typst
#cover(title: "2010～2025高考真题（全国卷）", subtitle: "数学", author: "gbchu")
```
![效果图](/cover.png)

### 参数

#### `title`

`类型: str | content`

`默认值: "ezexam"`

>该参数用于设置封面的标题

#### `subtitle`

`类型: str | content`

`默认值: none`

>该参数用于设置封面的子标题

#### `author`

`类型: str | content`

`默认值: none`

>该参数用于设置作者信息

#### `date`

`类型: str | content | datetime`

`默认值: 当前日期`

>该参数用于设置日期信息
