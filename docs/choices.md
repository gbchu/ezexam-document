# `choices` 方法

该方法为选择题的选项排列

#### 示例
```typst
#choices([$-1$], [$0$], [$1$], [$6$])

// 输出
A. -1     B.  0    C.  1     D.  6
```
::: warning
  某个选项中如果既有文字又有图片，则图片必须使用 `box` 等容器包裹，否则将不显示!
:::
### 参数

#### `columns` <Badge type="warning" text="^0.1.8" />

`类型: int | auto`

`默认值: auto`
>该参数用于设置选项排列的列数,如未指定列数，则默认根据内容自动排列

::: tip
在 <Badge type="warning" text="0.1.8" /> 之前该参数名为 `column`
:::

#### `c-gap`

`类型: length`

`默认值: 0pt`
>该参数用于设置选项之间的水平间距

#### `r-gap`

`类型: length`

`默认值: 25pt`
>该参数用于设置选项之间的垂直间距

#### `indent`

`类型: length`

`默认值: 0pt`
>该参数用于设置选项的缩进

#### `body-indent`

`类型: length`

`默认值: 5pt`
>该参数用于设置选项和标签$ABCD$之间的距离

#### `top`

`类型: length`

`默认值: 0pt`
>该参数用于设置选项距离上方的距离

#### `bottom`

`类型: length`

`默认值: 0pt`
>该参数用于设置选项距离下方的距离

#### `label`

`类型: str`

`默认值: A.`

>该参数用于设置选项的标签

::: tip
若要修改标签类型，可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置。
:::

示例
```typst
#choices(
  label:"①",
  [选项1],
  [选项2],
  [选项3],
  [选项4],
)
// 输出结果
① 选项1       ② 选项2         ③ 选项3         ④ 选项4
```

#### `options`

>该参数为可变参数，即传递的选项


