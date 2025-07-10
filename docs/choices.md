# `choices方法`
>该方法为选择题的选项排列
```typst
<!-- 使用方法 -->
#choices([$-1$], [$0$], [$1$], [$6$])

<!-- 效果 -->
A. -1     B.  0    C.  1     D.  6
```
### 参数及其默认值

#### `column`

`type: int | auto`

`default: auto`
>该参数用于设置选项排列的列数,如未指定列数，则默认根据内容自动排列

#### `c-gap`

`type: length`

`default: 0pt`
>该参数用于设置选项之间的水平间距

#### `r-gap`

`type: length`

`default: 25pt`
>该参数用于设置选项之间的垂直间距

#### `indent`

`type: length`

`default: 0pt`
>该参数用于设置选项的缩进

#### `body-indent`

`type: length`

`default: 5pt`
>该参数用于设置选项和标签$ABCD$之间的距离

#### `top`

`type: length`

`default: 0pt`
>该参数用于设置选项距离上方的距离

#### `bottom`

`type: length`

`default: 0pt`
>该参数用于设置选项距离下方的距离

#### `label`

`type: str`

`default: A.`
>该参数用于设置选项的标签类型
::: tip
若要修改标签类型，可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置
:::
#### `options`

>该参数为可变参数，即传递的选项
