# `color-box` 方法

该方法生成一个行内的彩色盒子

#### 示例
```typst
#color-box[2025新高考I卷]#lorem(20)
```
![效果图](/color-box.png)
### 参数

#### `color`

`类型: color`

`默认值: blue`

>该参数用于设置盒子的边框颜色

#### `dash`

`类型: str | none | auo | array | dictionary`

`default: "dotted"`

>该参数用于设置盒子的边框类型
::: tip
此设置的可选值参考官方文档 [线的类型](https://typst.app/docs/reference/visualize/stroke/#constructor-dash)
:::
#### `radius`

`类型: length`

`default: 3pt`

>该参数用于设置盒子的圆角

#### `body`

`类型: str | content`

>该参数为位置参数，设置盒子内容