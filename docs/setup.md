# `setup方法`

>该方法用于全局参数的设置,需配合 `#show 和 with 方法使用`

### 参数及其默认值

#### `mode`

`type: str`

`default: LECTURE`

`optional value: EXAM`

>该参数用于设置模板的显示模式 `LECTURE` : 讲义模式； `EXAM` : 试卷模式 `LECTURE` 模式和 `EXAM` 模式二者仅在题号的显示方式、目录显示方式、页码显示上有所不同。若你只想组卷则只用 `EXAM` 模式即可！

#### `paper`

`type: dictionary`

`default: a4`

`optional value: a3`

>该参数用于设置模板的页面类型、边距、是否翻转、是否分页

```typst
    a3 和 a4 的默认值

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
> `a3` 和 `a4` 是内部自定义的两个变量，若需要自定义页面类型，则需要使用字典覆盖默认值，格式如上所示。例如：在调用 `setup` 方法时 `paper` 参数使用 `( paper: "b5", margin: .5in, columns: 2, flipped: true,)` 而非定义好的 `a3` 或 `a4`
::: warning
修改该参数可能会导致页面布局混乱，仅在a3 和 a4 尺寸下测试过
:::
#### `page-numbering`

`type: str | function`

`default: auto`

>该参数用于设置模板的页码显示方式
>
>`EXAM` 模式下默认显示为: `XX试题  第X页（共X页）`
>
>`LECTURE` 模式下默认显示为: `X / X`
::: tip
若要修改显示格式可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置
:::
#### `page-align`

`type: alignment`

`default: center`

>该参数用于设置模板的页码对齐方式
::: tip
若要修改对齐方式可参考官方文档 [alignment](https://typst.app/docs/reference/layout/alignment/) 的参数设置

若想实现奇数页在右侧显示，偶数页在左侧显示的效果，可忽略该参数，修改 [`footer-is-separate`](#footer-is-separate) 参数为 `false` 即可
:::
#### `footer-is-separate`

`type: boolean`

`default: true`

>该参数用于设置在页面多列显示时，页脚的页码是否在每一列中都显示

#### `outline-page-numbering`

`type: str | function`

`default: ⚜ I ⚜`

>该参数用于设置目录的页码显示

::: tip
若要修改显示格式可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置
:::
#### `gap`

`type: length`

`default: 1in`

>该参数用于设置多列显示时，列之间的间距

#### `show-gap-line`

`type: boolean`

`default: false`

>该参数用于设置多列显示时，列之间是否显示分隔线

#### `font-size`

`type: length`

`default: 11pt`

>该参数用于设置页面字体大小

#### `font`

`type: str | array`

`default: ("New Computer Modern Math", "Source Han Serif")`

>该参数用于设置页面的字体
::: tip
由于宋体不支持加粗，故本包在设置字体时使用的是思源宋体；在使用本包时，请自行下载 [思源宋体](https://github.com/adobe-fonts/source-han-serif/releases) 并安装。或者使用第三方 [粗体包](https://typst.app/universe/package/cuti)
:::
#### `font-math`

`type: str | array`

`default: ("New Computer Modern Math", "Source Han Serif")`

>该参数用于设置数学公式下的字体

#### `line-height`

`type: length`

`default: 2em`

>该参数用于设置行高

#### `par-spacing`

`type: length`

`default: 2em`

>该参数用于设置段落间距

#### `first-line-indent`

`type: length`

`default: 0em`

#### `heading-numbering`

`type: str | function`

`default: auto`

>该参数用于设置节标题前的编号方式

#### `heading-hang-indent`

`type: length`

`default: auto`

>该参数用于设置节标题的缩进

#### `heading-font`

`type: str | array`

`default: ("New Computer Modern Math", "SimHei")`

>该参数用于设置节标题的字体

#### `heading-size`

`type: length`

`default: auto`

>该参数用于设置节标题的字体大小

#### `heading-color`

`type: color`

`default: black`

>该参数用于设置节标题的字体颜色

#### `heading-top`

`type: length`

`default: 10pt`

>该参数用于设置节标题的上间距

#### `heading-bottom`

`type: length`

`default: 15pt`

>该参数用于设置节标题的下间距

#### `enum-numbering`

`type: str | function`

`default: "（1.i.a）"`

>该参数用于设置有序列表的编号方式

#### `enum-spacing`

`type: length`

`default: 2em`

>该参数用于设置有序列表的之间的间距

#### `enum-indent`

`type: length`

`default: 0pt`

>该参数用于设置有序列表的缩进

#### `show-answer`

`type: boolean`

`default: false`

>该参数用于设置是否显示答案

#### `answer-color`

`type: color`

`default: blue`

>该参数用于设置答案的颜色

#### `show-seal-line`

`type: boolean`

`default: true`

>该参数用于设置是否显示弥封线

#### `seal-line-student-info`

`type: dictionary`

`default:
 (
    姓名: underline[~~~~~~~~~~~~~],
    准考证号: inline-square(14),
    考场号: inline-square(2),
    座位号: inline-square(2),
  )`

>该参数用于设置考生信息

#### `seal-line-type`

`type: str | none | auo | array | dictionary`

`default: dashed`

>该参数用于设置弥封线的样式
::: tip
此设置的可选值参考官方文档 [线的类型](https://typst.app/docs/reference/visualize/stroke/#constructor-dash)
:::
#### `seal-line-supplement`

`type: str`

`default: 弥封线内不得答题`

>该参数用于设置弥封线的补充信息