# `solution方法` <Badge type="warning" text="^0.1.4" /> `explain` <Badge type="warning" text="0.1.0~0.1.3" />
>该方法为题目的解析
### 参数及其默认值

#### `title`

`type: str`

`default: none`

>该参数用于设置解析的标题

#### `title-size`

`type: length`

`default: 12pt`

>该参数用于设置标题字体大小

#### `title-weight`

`type: int | str`

`default: "bold"`

>该参数用于设置标题字体粗细

#### `title-color`

`type: color`

`default: white`

>该参数用于设置标题颜色

#### `title-bg-color`

`type: color`

`default: maroon`

>该参数用于设置标题背景色

#### `title-radius`

`type: length`

`default: 5pt`

>该参数用于设置标题的圆角大小

#### `title-align`

`type: alignment`

`default: top+center`

>该参数用于设置标题的对齐方式

#### `title-x`

`type: length`

`default: 0pt`

>该参数用于设置标题的水平方向上的位置

#### `title-y`

`type: length`

`default: 0pt`

>该参数用于设置标题的垂直方向上的位置

#### `border-style`

`type: str`

`default: "dashed"`

>该参数用于设置解析盒子的边框样式

#### `border-width`

`type: length`

`default: 0.5pt`

>该参数用于设置解析盒子的边框宽度

#### `border-color`

`type: color`

`default: maroon`

>该参数用于设置解析盒子的边框颜色

#### `color`

`type: color`

`default: blue`

>该参数用于设置解析的颜色

#### `radius`

`type: length`

`default: 5pt`

>该参数用于设置解析盒子的圆角大小

#### `inset`

`type: dictionary`

`default: (left: 10pt, right: 10pt,top: 20pt, bottom: 20pt)`

>该参数用于设置解析盒子的内边距

#### `margin-top`

`type: length`

`default: 0pt`

>该参数用于设置解析内容的上边距

#### `line-height`

`type: length`

`default: auto`

>该参数用于设置解析内容的行高，当解析中的公式比较高时，题号和解析内容会错位，这时可以通过该参数来微调。
:::tip
该参数虽然可以对齐，但会导致内容的每一行与行之间的间隔变大。如果你只想调节公式高的那些行，请使用 [height-content](https://ezexam.pages.dev/height-content) 方法
:::

#### `bg-color`

`type: color`

`default: white`

>该参数用于设置解析盒子的背景色

#### `breakable`

`type: boolean`

`default: true`

>该参数用于设置解析盒子是否可断行

#### `top`

`type: length`

`default: 20pt`

>该参数用于设置解析盒子距离上方的间距

::: tip
该参数在 <Badge type="warning" text="0.1.7" /> 版本之前，名为 `above` ；
:::


#### `bottom`

`type: length`

`default: 20pt`

>该参数用于设置解析盒子距离下方的间距
::: tip
该参数在 <Badge type="warning" text="0.1.7" /> 版本之前，名为 `bottom` ；
:::
#### `show-number`

`type: boolean`

`default: true`

>该参数用于设置是否显示解析对应的题号

#### `body`

`type: content`

>该参数为位置参数，解析内容