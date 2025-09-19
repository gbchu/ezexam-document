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

`类型: str`

`默认值: none`

>该参数用于设置解析的标题

#### `title-size`

`类型: length`

`默认值: 12pt`

>该参数用于设置标题字体大小

#### `title-weight`

`类型: int | str`

`默认值: "bold"`

>该参数用于设置标题字体粗细

#### `title-color`

`类型: color`

`默认值: white`

>该参数用于设置标题颜色

#### `title-bg-color`

`类型: color`

`默认值: maroon`

>该参数用于设置标题背景色

#### `title-radius`

`类型: length`

`默认值: 5pt`

>该参数用于设置标题的圆角大小

#### `title-align`

`类型: alignment`

`默认值: top+center`

>该参数用于设置标题的对齐方式

#### `title-x`

`类型: length`

`默认值: 0pt`

>该参数用于设置标题的水平方向上的位置

#### `title-y`

`类型: length`

`默认值: 0pt`

>该参数用于设置标题的垂直方向上的位置

#### `border-style`

`类型: str`

`默认值: "dashed"`

>该参数用于设置解析盒子的边框样式

#### `border-width`

`类型: length`

`默认值: 0.5pt`

>该参数用于设置解析盒子的边框宽度

#### `border-color`

`类型: color`

`默认值: maroon`

>该参数用于设置解析盒子的边框颜色

#### `color`

`类型: color`

`默认值: blue`

>该参数用于设置解析的颜色

#### `radius`

`类型: length`

`默认值: 5pt`

>该参数用于设置解析盒子的圆角大小

#### `inset`

`类型: dictionary`

`默认值: (left: 10pt, right: 10pt,top: 20pt, bottom: 20pt)`

>该参数用于设置最外层盒子的内边距

#### `bg-color`

`类型: color`

`默认值: white`

>该参数用于设置解析盒子的背景色

#### `breakable`

`类型: boolean`

`默认值: true`

>该参数用于设置解析盒子是否可断行

#### `top`

`类型: length`

`默认值: 0pt`

>该参数用于设置解析盒子距离上方的间距

::: tip
该参数在 <Badge type="warning" text="0.1.7" /> 版本之前，名为 `above` ；
:::


#### `bottom`

`类型: length`

`默认值: 0pt`

>该参数用于设置解析盒子距离下方的间距
::: tip
该参数在 <Badge type="warning" text="0.1.7" /> 版本之前，名为 `bottom` ；
:::

#### `padding-top`

`类型: length`

`默认值: 0pt`
>该参数用于设置解析内容的上方内边距

#### `padding-bottom`

`类型: length`

`默认值: 0pt`
>该参数用于设置解析内容的下方内边距

::: tip
`padding-top` 和 `padding-bottom` 参数是用来解决题号和解析对不齐的问题；如遇到该问题可调节该参数。详情参考 [使用技巧](https://ezexam.pages.dev/tips)
:::

示例
```typst
// 修改之前的代码
  #solution(title: "解析")[
    $"解：原式" &=∫(1+cos 2x)/2 d x = 1/2 ∫(1+cos 2x)d x =
    1/2(∫1d x+ ∫cos 2x d x)\ &=1/2(x+∫cos 2x d x)=1/2(x+1/2 ∫cos 2x d 2x)\ &=1/2 (x+1/2
      sin 2x)=1/2 x+1/4 sin 2x+c$
  ]
```

![效果图](/tips1.png)

```typst

// 修改之后的代码
  #solution(inset: (top: 30pt),padding-top: 7pt, title: "解析")[
   $"解：原式" &=∫(1+cos 2x)/2 d x = 1/2 ∫(1+cos 2x)d x =
    1/2(∫1d x+ ∫cos 2x d x)\ &=1/2(x+∫cos 2x d x)=1/2(x+1/2 ∫cos 2x d 2x)\ &=1/2 (x+1/2
      sin 2x)=1/2 x+1/4 sin 2x+c$
  ]
```

![效果图](/tips2.png)

#### `show-number`

`类型: boolean`

`默认值: true`

>该参数用于设置是否显示解析内容对应的题号

#### `body`

`类型: content`

>该参数为位置参数，解析内容