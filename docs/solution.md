# `solution` 方法

该方法为题目的解析

::: tip
该方法在 <Badge type="warning" text="0.1.4" /> 之前名为 `explain`
:::

#### 示例
```typst
  #solution(inset: (top: 30pt), padding-top: 7pt, title: "解析")[
   $"解：原式" &=∫(1+cos 2x)/2 d x = 1/2 ∫(1+cos 2x)d x =
    1/2(∫1d x+ ∫cos 2x d x)\ &=1/2(x+∫cos 2x d x)=1/2(x+1/2 ∫cos 2x d 2x)\ &=1/2 (x+1/2
      sin 2x)=1/2 x+1/4 sin 2x+c$
  ]
```

![效果图](/tips2.png)


### 参数

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

>该参数用于设置最外层盒子的内边距

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

`default: 0pt`

>该参数用于设置解析盒子距离上方的间距

::: tip
该参数在 <Badge type="warning" text="0.1.7" /> 版本之前，名为 `above` ；
:::


#### `bottom`

`type: length`

`default: 0pt`

>该参数用于设置解析盒子距离下方的间距
::: tip
该参数在 <Badge type="warning" text="0.1.7" /> 版本之前，名为 `bottom` ；
:::

#### `padding-top`

`type: length`

`default: 0pt`
>该参数用于设置解析内容的上方内边距

#### `padding-bottom`

`type: length`

`default: 0pt`
>该参数用于设置解析内容的下方内边距

::: tip
`padding-top` 和 `padding-bottom` 参数是用来解决题号和解析对不齐的问题；如遇到该问题可调节该参数。详情参考 [使用技巧](https://ezexam.pages.dev/tips)
:::

#### `show-number`

`type: boolean`

`default: true`

>该参数用于设置是否显示解析内容对应的题号

#### `body`

`type: content`

>该参数为位置参数，解析内容