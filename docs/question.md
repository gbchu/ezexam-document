# `question方法`
### 参数及其默认值
```typst
<!-- 使用方法 -->
#question(label-color: green)[
  $(1 + 5i)i$ 的虚部为 #paren[]
  #choices([$-1$], [$0$], [$1$], [$6$])
]
```
#### `body-indent`

`type: length`

`default: 0.6em`
>该参数用于设置题目和题号间的间隔

#### `indent`

`type: length`

`default: 0pt`
>该参数用于设置题目的缩进

#### `line-height`

`type: length`

`default: auto`
>该参数用于设置题目内容的行高，当题目中的公式比较高时，题号和题目内容会错位，这时可以通过该参数来微调。
:::tip
该参数虽然可以对齐，但会导致内容的每一行与行之间的间隔变大。如果你只想调节公式高的那些行，请使用 [height-content](https://ezexam.pages.dev/height-content) 方法
:::

#### `label`

`type: str | function`

`default: auto`
>该参数用于设置题号的类型
::: tip
若要修改题号类型，可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置
:::
#### `label-color`

`type: color`

`default: black`
>该参数用于设置题号的颜色

#### `label-weight`

`type: str | int`

`default: regular`
>该参数用于设置题号字体的粗细

#### `points`

`type: none | int`

`default: none`
>该参数用于设置题目的分值

#### `points-separate` <Badge type="warning" text="^0.1.3" /> `points-separate-par` <Badge type="warning" text="0.1.0~0.1.2" />

`type: boolean`

`default: true`
>该参数用于设置题目的分值是否独占一行

#### `points-prefix`

`type: str`

`default: " ("`
>该参数用于设置题目分值前缀

#### `points-suffix`

`type: str`

`default: "分）"`
>该参数用于设置题目的分值后缀

#### `top`

`type: length`

`default: 0pt`
>该参数用于设置题目距离上方的距离

#### `bottom`

`type: length`

`default: 0pt`
>该参数用于设置题目距离下方的距离

#### `with-heading-label`

`type: boolean`

`default: false`
>该参数用于设置题目是否带有标题的标签

#### `body`

`type: content`
>该参数为位置参数，题目的内容