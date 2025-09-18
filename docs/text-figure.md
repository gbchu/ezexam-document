# `text-figure` 方法
>该方法用于图文混排，默认为左文字，右图

#### 示例
```typst
#text-figure(
    text: choices(
      column: 1,
      [轻风 (1.6$tilde$3.3 m/s)],
      [微风 (3.4$tilde$5.4 m/s)],
      [和风 (5.5$tilde$7.8 m/s)],
      [劲风 (8.0$tilde$10.7 m/s)],
    ),
    image("6.png", width: 50%)
  )
```
![效果图](/tf.png)

### 参数及其默认值

#### `text`

`type: any`

`default: ""`

>该参数用于设置左侧显示的文字

#### `figure`

`type: any`

>该参数为位置参数，一般用于设置右侧的图片或表格

::: warning
 若传入的 `figure` 为图片时，在给图片设置 `width` 时，不要使用 `%` 单位。特别是选项和图片排列时。如果设置百分比，图片将不显示。
:::

#### `figure-x`

`type: length`

`default: 0pt`

>该参数用于设置图片或表格水平之间的距离

#### `figure-y`

`type: length`

`default: 0pt`

>该参数用于设置图片或表格垂直方向上的距离

#### `top`

`type: length`

`default: 0pt`

>该参数用于设置图文距离上方的距离

#### `bottom`

`type: length`

`default: 0pt`

>该参数用于设置图文距离下方的距离