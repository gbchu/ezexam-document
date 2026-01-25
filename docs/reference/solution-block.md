# `solution-block` 方法 <Badge type="tip" text="0.2.9" />

解析块，该方法可以自动设置标题为参考答案，页码的格式符合参考答案格式。

#### 示例
```typst
#solution-block[
  #let answer = tag.with(prefix: "答案：", suffix: [ \ ], color: maroon)

  #solution(title: "解析")[
    #answer[A]
    解: #lorem(6)#score(6)
  ]

  #solution[
    #answer[B]
    解: #lorem(8)#score(8)
  ]

]

```

### 效果
![效果图](/solution-block.jpg)

::: warning
请勿在该方法中使用 `title` 方法，否则可能会造成页码或弥封线错乱！若想修改标题使用下面的 `name` 参数！
:::

### 参数

#### `name`

`类型: str`

`默认值: "参考答案"`

>该参数用于设置解析块的标题

#### `body`

`类型: str | content`

`默认值: 无`

>该参数为位置参数，用于设置解析中的内容