# `inline-square方法`
>该方法生成行内排列的小方格，用于弥封线内准考证号，座位号，考号的占位
```typst
<!-- 使用方法 -->
#inline-square(2)
```
效果如下：
| &nbsp;&nbsp; |   &nbsp;&nbsp;     |
|------|-------|
### 参数及其默认值

#### `num`

`type: int`

>该参数为位置参数，用于设置生成小方格的数量

#### `width`

`type: length`

`default: 1.5em`
>该参数用于设置小方格的宽度

#### `gap`

`type: length`

`default: 0pt`

>该参数用于设置小方格间的间距

#### `body`

`type: str | content`

`default: ""`

>该参数用于设置小方格内的文字内容