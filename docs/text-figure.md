# `text-figure` 方法

该方法用于图文混排，默认为左文右图

#### 示例
```typst
#text-figure(
    figure: image("wechatpay.png")
  )[#lorem(50)]
```
![效果图](/tf.png)

### 参数

#### `text`

`类型: content`

`默认值: 无`

>该参数为位置参数，用于设置要排列的文本

::: tip
该参数在 <Badge type="warning" text="0.1.9" /> 版本之前为命名参数。
:::

```typst
// 使用方法
#text-figure(
    text: lorem(50)
  )[#image("wechatpay.png")]
```

#### `figure` <Badge type="warning" text="^0.1.9" />

`类型: image | table`

`默认值: none`

>该参数用于设置要排列的图表；


#### `figure-x`

`类型: length`

`默认值: 0pt`

>该参数用于设置图表水平之间的距离

#### `figure-y`

`类型: length`

`默认值: 0pt`

>该参数用于设置图表垂直方向上的距离

#### `style` <Badge type="warning" text="^0.1.9" />

`类型: str`

`默认值: "tf"`

`可选值: "ft"`

>该参数用于设置排版方式；默认为左文右图

#### 示例
```typst
#text-figure(
    figure: image("wechatpay.png"),
    style: "ft"
  )[#lorem(50)]
```
![效果图](/tf2.png)

#### `top`

`类型: length`

`默认值: 0pt`

>该参数用于设置图文距离上方的距离

#### `bottom`

`类型: length`

`默认值: 0pt`

>该参数用于设置图文距离下方的距离