# `solution-block` 方法 <Badge type="warning" text="0.2.9" />

解析块，该方法可以自动设置标题，页码格式（`XX参考答案第X页（共X页）`）。

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

效果：

![效果图](/solution-block.jpg)

::: warning
请勿在该方法中使用 `title` 方法，否则可能会造成页码或弥封线错乱！若想修改标题使用下面的 `name` 参数！
:::

### 参数

#### `name`

`类型: str`

`默认值: "参考答案"`

>该参数用于设置解析块的标题

#### `paper` <Badge type="warning" text="0.3.6" />

`类型: dictionary`

`默认值: (:)`

>该参数可以设置解析页面显示方式

::: tip
在排版试卷时，经常试卷页需要 `a3` 显示，解析页 `a4` 显示，此时该参数就派上用场了。
推荐使用本模版内置的常量 [`a3` 和 `a4`](/reference/setup.md#paper) 即可达成想要的效果。

如果效果不满意，该参数字典的值可以参考官方 [`page`](https://typst.app/docs/reference/layout/page/#parameters) 的参数进行设置！
:::

#### `body`

`类型: str | content`

`默认值: 无`

>该参数为位置参数，用于设置解析中的内容