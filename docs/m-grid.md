# `m-grid方法`

>该方法生成行一系列的小方格，用于弥封线内准考证号、座位号、考号、语文作文等的占位
```typst
<!-- 使用方法 -->
#m-grid(column: 2)
```
效果如下：
| &nbsp;&nbsp; |   &nbsp;&nbsp;     |
|------|-------|

### 参数及其默认值

#### `column`

`type: int`

>该参数用于设置生成小方格的列数

#### `row`

`type: int`

>该参数用于设置生成小方格的行数

#### `inset`

`type: length | array | dictionary`

`default: .8em`
>该参数用于设置小方格的内边距

#### `gap`

`type: length`

`default: 0pt`

>该参数用于设置小方格间的间距

#### `body`

`type: array`

`default: ([],)`

>该参数用于设置小方格内的文字内容

::: tip
`body` 参数数组的元素为 `content` 类型
:::
