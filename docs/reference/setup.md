# `setup` 方法

该方法用于模板的全局设置

#### 示例
```typst
#show: setup.with(mode: EXAM, paper: a3, ..)
```

### 参数
#### `mode`

`类型: str`

`默认值: HANDOUTS` <Badge type="warning" text="^0.1.4" /> `LECTURE` <Badge type="warning" text="0.1.0~0.1.3" />

`可选值: EXAM` 、 `SOLUTION` <Badge type="warning" text="^0.1.8" />

>该参数用于设置模板的显示模式
>
>`EXAM` : 试卷模式；`SOLUTION` : 解析模式；`HANDOUTS` : 讲义模式
::: tip
`HANDOUTS` 模式和 `EXAM` 模式二者仅在题号的显示方式、目录显示方式、页码显示上有所不同。若你只想组卷则只用 `EXAM` 模式即可！`SOLUTION` 模式仅当答案独立于内容时，使用该模式。该模式为预定义好的格式，如果不满意可不用该模式自行调整！
:::

#### `paper`

`类型: dictionary`

`默认值: a4`

`可选值: a3`

>该参数用于设置模板的页面类型、边距、是否翻转、分页

```typst
   // a3 和 a4 的默认值
    #let a3 = (
      paper: "a3",
      margin: 1in,
      columns: 2,
      flipped: true,
    )

    #let a4 = (
      paper: "a4",
      margin: 1in,
      columns: 1,
      flipped: false,
    )
```
> `a3` 和 `a4` 是内部预定义的两个变量，若需要自定义页面类型，则需要使用字典覆盖默认值

::: warning
本模板仅在 `a3` 和 `a4` 尺寸下测试过；修改该参数可能会导致页面布局混乱。
:::

#### `page-numbering`

`类型: str | function`

>该参数用于设置模板的页码显示方式
>
>`EXAM` 模式下默认显示为: `XX试题  第X页（共X页）`
>
>`SOLUTION` 模式下默认显示为: `XX试题答案  第X页（共X页）`
>
>`HANDOUTS` 模式下默认显示为: `X / X`

::: tip
若要修改显示格式可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置。
:::

#### `page-align`

`类型: alignment`

`默认值: center`

>该参数用于设置模板的页码对齐方式

::: tip
1. 若要修改对齐方式可参考官方文档 [alignment](https://typst.app/docs/reference/layout/alignment/) 的参数设置。

2. 若想实现奇数页在右侧显示，偶数页在左侧显示的效果，可忽略该参数，修改 [`footer-is-separate`](#footer-is-separate) 参数为 `false` 即可。
:::

#### `footer-is-separate`

`类型: boolean`

`默认值: true`

>该参数用于设置在页面多列显示时，页脚的页码是否在每一列中都显示

#### `outline-page-numbering`

`类型: str | function`

`默认值: "⚜ I ⚜"`

>该参数用于设置目录的页码显示

::: tip
若要修改显示格式可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置。
:::

#### `gap`

`类型: length`

`默认值: 1in`

>该参数用于设置多列显示时，列之间的间距

#### `show-gap-line`

`类型: boolean`

`默认值: false`

>该参数用于设置多列显示时，列之间是否显示分隔线

#### `font-size`

`类型: length`

`默认值: 11pt`

>该参数用于设置页面字体大小

#### `font`

`类型: str | array`

`默认值: ("New Computer Modern Math", "Source Han Serif", "SimSun")`

`默认值: ("STIX Two Math", "New Computer Modern Math", "Source Han Serif", "SimSun")` <Badge type="warning" text="^0.2.1" />

>该参数用于设置页面的字体

::: tip
由于宋体不支持加粗，故本包中文默认字体为思源宋体；当前如果没有该字体则默认使用宋体。在使用本包时，自行下载 [思源宋体](https://cloud.189.cn/web/share?code=n22ae2RnUbEn) （密码：z7zb）并安装在对应的操作系统中（安装后需要重启系统）；然后修改该参数即可。
:::

#### `font-math`

`类型: str | array`

`默认值: ("New Computer Modern Math", "Source Han Serif", "SimSun")`

`默认值: ("STIX Two Math", "New Computer Modern Math", "Source Han Serif", "SimSun")` <Badge type="warning" text="^0.2.1" />

>该参数用于设置数学公式下的字体

::: tip
若想使用 `Times New Roman` 风格的字体；自行下载 [STIX 2 字体](https://wwoq.lanzouo.com/iGWQY37xdrsh
)（密码：aa91） 并安装在对应的操作系统中（安装后需要重启系统）即可。
:::

::: warning
如果使用的是 <Badge type="warning" text="0.2.1" /> 以下的版本，安装 STIX 2 字体后需要同时修改 `font` 和 `font-math` 参数才生效！
:::

#### `line-height`

`类型: length`

`默认值: 2em`

>该参数用于设置行高

#### `par-spacing`

`类型: length`

`默认值: 2em`

>该参数用于设置段落间距

#### `first-line-indent`

`类型: length`

`默认值: 0em`

>该参数用于设置首行缩进

#### `heading-numbering` <Badge type="warning" text="^0.1.3" />

`类型: str | function`

`默认值: auto`

>该参数用于设置节标题前的编号方式

#### `heading-hang-indent` <Badge type="warning" text="^0.1.3" />

`类型: length`

`默认值: auto`

>该参数用于设置节标题非首行的缩进

#### `heading-font`

`类型: str | array`

`默认值: ("New Computer Modern Math", "SimHei")`

>该参数用于设置节标题的字体

#### `h1-size` <Badge type="warning" text="^0.1.7" />

`类型: length`

`默认值: auto`

>该参数用于设置一级标题的字体大小

::: warning
在 <Badge type="tip" text="0.1.7" /> 版本之前，该参数名为 `heading-size` 且会改变所有级别的节标题。
:::

#### `heading-color`

`类型: color`

`默认值: black`

>该参数用于设置节标题的字体颜色

#### `heading-top`

`类型: length`

`默认值: 10pt`

>该参数用于设置节标题的上间距

#### `heading-bottom`

`类型: length`

`默认值: 15pt`

>该参数用于设置节标题的下间距

#### `enum-numbering` <Badge type="warning" text="^0.1.2" />

`类型: str | function`

`默认值: "（1.i.a）"` <Badge type="warning" text="^0.1.8" /> `（1.1.i.a）` <Badge type="warning" text="0.1.0~0.1.7" />

>该参数用于设置有序列表的编号方式

#### `enum-spacing` <Badge type="warning" text="^0.1.3" />

`类型: length`

`默认值: 2em`

>该参数用于设置有序列表的之间的间距

#### `enum-indent` <Badge type="warning" text="^0.1.3" />

`类型: length`

`默认值: 0pt`

>该参数用于设置有序列表的缩进

#### `watermark` <Badge type="warning" text="^0.1.4" />

`类型: none | content | image`

`默认值: none`

>该参数用于设置水印的内容

#### `watermark-color` <Badge type="warning" text="^0.1.4" />

`类型: color`

`默认值: rgb("f666")`

>该参数用于设置水印的颜色
::: warning
该参数对图片水印无效。在修改该参数时，一定要修改颜色的透明度，否则水印将覆盖在文字之上。（这是由于水印的实现是基于前景色）详情设置参考 [color](https://typst.app/docs/reference/visualize/color/)。
:::

#### `watermark-font` <Badge type="warning" text="^0.1.4" />

`类型: str | array`

`默认值: ("New Computer Modern Math", "Source Han Serif")`

>该参数用于设置水印的字体
::: warning
该参数对图片水印无效。
:::

#### `watermark-size` <Badge type="warning" text="^0.1.4" />

`类型: length`

`默认值: 88pt`

>该参数用于设置水印的字体大小
::: warning
该参数对图片水印无效，但可以通过传入图片时设置宽高调整图片大小。
:::

#### `watermark-rotate` <Badge type="warning" text="^0.1.4" />

`类型: angle`

`默认值: -45deg`

>该参数用于设置水印的旋转角度

#### `show-answer`

`类型: boolean`

`默认值: false`

>该参数用于设置是否显示答案

#### `answer-color`

`类型: color`

`默认值: blue`

>该参数用于设置答案的颜色

#### `show-seal-line`

`类型: boolean`

`默认值: true`

>该参数用于设置是否显示弥封线

#### `seal-line-student-info`

`类型: dictionary`

`默认值: `
```typst
 (
    姓名: underline[~~~~~~~~~~~~~],
    准考证号: table(columns: 14, inset: .8em,[]),
    考场号: table(columns: 2, inset: .8em,[]),
    座位号: table(columns: 2, inset: .8em,[])
 )
```

>该参数用于设置考生信息

#### `seal-line-type`

`类型: str | none | auto | array | dictionary`

`默认值: "dashed"`

>该参数用于设置弥封线的样式

::: tip
此设置的可选值参考官方文档 [线的类型](https://typst.app/docs/reference/visualize/stroke/#constructor-dash)。
:::

#### `seal-line-supplement`

`类型: str`

`默认值: "弥封线内不得答题"`

>该参数用于设置弥封线内的补充信息