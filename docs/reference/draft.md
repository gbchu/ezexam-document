# `draft` 方法

该方法生成草稿纸

#### 示例
```typst
#draft()
```

![效果图](/draft.png)


### 参数

#### `name`

`类型: str`

`默认值: "草稿纸"`
>该参数用于设置小草稿纸的标题

#### `student-info`

`类型: dictionary`

`默认值: `
```typst
(
    姓名: underline[~~~~~~~~~~~~~],
    准考证号: underline[~~~~~~~~~~~~~~~~~~~~~~~~~~],
    考场号: underline[~~~~~~~],
    座位号: underline[~~~~~~~],
)
```

>该参数用于设置考生信息

#### `dash`

`类型: str | none | auo | array | dictionary`

`默认值: dashed`

> 该参数用于设置草稿纸下的横线样式

::: tip
此设置的可选值参考官方文档 [线的类型](https://typst.app/docs/reference/visualize/stroke/#constructor-dash)。
:::
#### `supplement`

`类型: str | none | auo | array | dictionary`

`默认值: ""`

>该参数用于设置草稿纸的补充内容


```typst
#draft(supplement: "中国高级中学")
```
![效果图](/draft2.png)
