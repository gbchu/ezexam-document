# `setup` 方法

该方法用于模板的全局设置。包含页面、字体、段落、页脚、多级标题、有序、无序列表、水印、密封线等

#### 示例
```typst
#show: setup.with(mode: EXAM, paper: a3, ..)
```

### 参数
#### `mode`

`类型: str`

`默认值: HANDOUTS` <Badge type="warning" text="0.1.4" />

`可选值: EXAM`

>该参数用于设置模板的显示模式
>
>`EXAM` : 试卷模式；`HANDOUTS` : 讲义模式
::: tip
`HANDOUTS` 模式和 `EXAM` 模式二者仅在题号的显示方式、目录显示方式、页码显示上有所不同。若你只想排版试卷则只用 `EXAM` 模式即可！
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
>`EXAM` 模式下默认显示为: `XX试题第X页（共X页）`
>
>`HANDOUTS` 模式下默认显示为: `X / X`

::: tip
若要修改显示格式可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置。
:::

::: warning
若该参数传入的是函数，请使用内置的 [zh-arabic](/reference/zh-arabic) 方法，不要自定义方法，否则页码的显示可能会出现问题！
:::

#### `page-align`

`类型: alignment`

`默认值: center`

`可选值: "odd-r-even-l"` <Badge type="warning" text="0.2.9" />

>该参数用于设置模板的页码对齐方式

::: tip
1. 若要修改对齐方式可参考官方文档 [alignment](https://typst.app/docs/reference/layout/alignment/) 的参数设置。

2. 从 `0.2.9` 版本开始，若要实现奇数页从右开始，偶数页从左开始，使用可选值即可实现。废弃掉设置 [`footer-is-separate`](#footer-is-separate) 参数为 `false` 实现该效果。
:::

#### `footer-is-separate`

`类型: boolean`

`默认值: true`

>该参数用于设置在页面多列显示时，页脚的页码是否在每一列中都显示

#### `outline-page-numbering`

`类型: str | function`

`默认值: "I"`

>该参数用于设置目录的页码显示

::: tip
若要修改显示格式可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置。
:::

::: warning
若该参数传入的是函数，请使用内置的 [zh-arabic](/reference/zh-arabic) 方法，不要自定义方法，否则页码的显示可能会出现问题！
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

`类型: array`

`默认值: ("New Computer Modern Math", "Noto Serif CJK SC")`<!--  <Badge type="warning" text="0.2.5" /> -->

`默认值:` <Badge type="warning" text="0.2.8" />
```typst
 (
    (name: "Times New Roman", covers: regex("\w")), // 正文中的数字，字母字体
    (name: "TeX Gyre Termes", covers: regex("\w")), // （无Times New Roman字体时）正文中的数字，字母字体
    "TeX Gyre Termes Math", // 数学字体
    "Noto Serif CJK SC" // 中文字体
 )
```

`默认值:` <Badge type="warning" text="0.3.2" />
```typst
 (
    (name: "Times New Roman", covers: regex("\w")), // 正文中的数字，字母字体
    (name: "STIX Two Math", covers: regex("[^𝑗𝑓𝑧𝜋∅/]")), // 除𝑗𝑓𝑧𝜋∅/符号外的数学字体
    "TeX Gyre Termes Math", // 𝑗𝑓𝑧𝜋∅/ 的数学字体
    "Noto Serif CJK SC" // 中文字体
 )
```

>该参数用于设置页面的字体

::: tip
1. 初次使用本模板时，可能会报 `unknown font family` 字体警告，原因是当前系统中没有对应的字体。可将缺少的字体下载到本地并安装，安装后需重启操作系统!（`TypstApp` 在线用户将警告的字体上传到项目根目录即可去除）。
[字体](https://wwbbc.lanzouv.com/b016kpznmj) （密码：666）

2. 若想自定义字体，可在安装字体后需要自行修改 [font](#font) 参数的值！该值必须为数组，西文字体、数学字体在前，中文字体在后（若用到数学公式则必须指定数学字体）；可参考最新 [font](#font) 的值。

3. <Badge type="warning" text="0.3.2" /> 新增可选字体 `ncm-font` (New Computer Modern系列字体)
:::

<!-- #### `font-math`

`类型: str | array`

`默认值: ("New Computer Modern Math", "Source Han Serif", "SimSun")`

`默认值: ("STIX Two Math", "New Computer Modern Math", "Source Han Serif")` <Badge type="warning" text="0.2.1" />

>该参数用于设置数学公式下的字体

::: warning
该参数从 <Badge type="warning" text="0.2.2" /> 开始已弃用；使用 [font](#font) 参数即可完成数学字体的修改。
::: -->

#### `line-height`

`类型: length`

`默认值: 2em`

>该参数用于设置行高

#### `par-spacing`

`类型: length`

`默认值: 2em`

>该参数用于设置段落间距

#### `par-justify` <Badge type="warning" text="0.2.9" />

`类型: boolean`

`默认值: false`

>该参数用于设置段落是否两端对齐

#### `first-line-indent`

`类型: length`

`默认值: 0em`

>该参数用于设置首行缩进

#### `heading-numbering` <Badge type="warning" text="0.1.3" />

`类型: str | function`

`默认值: auto`

>该参数用于设置节标题前的编号方式

#### `heading-hang-indent` <Badge type="warning" text="0.1.3" />

`类型: length`

`默认值: auto`

>该参数用于设置节标题非首行的缩进

#### `heading-font`

`类型: str | array`

`默认值: ("New Computer Modern Math", "SimHei")`

>该参数用于设置节标题的字体

#### `h1-size` <Badge type="warning" text="0.1.7" />

`类型: length`

`默认值: auto`

>该参数用于设置一级标题的字体大小

::: warning
在 <Badge type="warning" text="0.1.7" /> 版本之前，该参数名为 `heading-size` 且会改变所有级别的节标题。
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

#### `enum-numbering` <Badge type="warning" text="0.1.2" />

`类型: str | function`

`默认值: "（1.i.a）"` <Badge type="warning" text="0.1.8" /> `（1.1.i.a）` <Badge type="warning" text="0.1.0~0.1.7" />

>该参数用于设置有序列表前的编号方式

#### `enum-spacing` <Badge type="warning" text="0.1.3" />

`类型: length`

`默认值: 2em`

>该参数用于设置有序列表项之间的间距

#### `enum-indent` <Badge type="warning" text="0.1.3" />

`类型: length`

`默认值: 0pt`

>该参数用于设置有序列表的缩进

#### `list-marker` <Badge type="warning" text="0.3.0" />

`类型: content | array | function`

`默认值: ([•], [‣], [–])`

>该参数用于设置无序列表前的标记样式

#### `list-spacing` <Badge type="warning" text="0.3.0" />

`类型: length`

`默认值: auto`

>该参数用于设置无序列表项之间的间距

#### `list-indent` <Badge type="warning" text="0.3.0" />

`类型: length`

`默认值: 0pt`

>该参数用于设置无序列表的缩进

#### `ref-color` <Badge type="warning" text="0.3.0" />

`类型: color`

`默认值: rgb("#0a6e96")`

>该参数用于设置引用的颜色

#### `resume` <Badge type="warning" text="0.2.8" />

`类型: boolean`

`默认值: true`

>该参数用于设置题目的题号在使用 `heading` 中断后是否继续编号

#### `watermark` <Badge type="warning" text="0.1.4" />

`类型: none | content | image`

`默认值: none`

>该参数用于设置水印的内容

#### `watermark-color` <Badge type="warning" text="0.1.4" />

`类型: color`

`默认值: rgb("f666")`

>该参数用于设置水印的颜色
::: warning
该参数对图片水印无效。在修改该参数时，一定要修改颜色的透明度，否则水印将覆盖在文字之上。（这是由于水印的实现是基于前景色）详情设置参考 [color](https://typst.app/docs/reference/visualize/color/)。
:::

#### `watermark-font` <Badge type="warning" text="0.1.4" />

`类型: str | array`

`默认值: ("New Computer Modern Math", "Source Han Serif")`

>该参数用于设置水印的字体
::: warning
该参数对图片水印无效。
:::

#### `watermark-size` <Badge type="warning" text="0.1.4" />

`类型: length`

`默认值: 88pt`

>该参数用于设置水印的字体大小
::: warning
该参数对图片水印无效，但可以通过传入图片时设置宽高调整图片大小。
:::

#### `watermark-rotate` <Badge type="warning" text="0.1.4" />

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

::: warning
弥封线的实现依赖于 `title` 方法，因此，若要该参数生效，需要在文档中调用 `title` 方法。
:::

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

>该参数用于设置考生等相关信息

#### `seal-line-type`

`类型: str | none | auto | array | dictionary`

`默认值: "dashed"`

>该参数用于设置弥封线的样式

::: tip
此设置的可选值参考官方文档 [线的类型](https://typst.app/docs/reference/visualize/stroke/#constructor-dash)。
:::

#### `seal-line-decoration` <Badge type="warning" text="0.2.9" />

`类型: str | none`

`默认值: none`

`可选值: "text" 、 "circle"`

>该参数用于为弥封线添加额外的装饰


#### `seal-line-supplement`

`类型: str`

`默认值: "弥封线内不得答题"`

>该参数用于设置弥封线内的补充信息

#### `seal-line-scope` <Badge type="warning" text="0.3.0" />

`类型: str`

`默认值: "every-page"`

`可选值: "first-page" 、 "odd-page"`

>该参数用于设置弥封线的页码范围