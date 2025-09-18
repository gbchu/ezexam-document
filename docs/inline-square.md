# `inline-square` 方法

该方法生成一系列的小方格，用于弥封线内准考证号，座位号，考号的占位

::: warning
该方法在 `0.1.8` 版本及以后已废弃，使用官方的 [`table`](https://typst.app/docs/reference/model/table/) 方法代替
:::
```typst
// 使用方法
#inline-square(2)
```
效果如下：
| &nbsp;&nbsp; |   &nbsp;&nbsp;     |
|------|-------|

```typst
// 使用table方法替代
#table(columns:2,[])
```

### 参数

#### `num`

`类型: int`

>该参数为位置参数，用于设置生成小方格的数量

#### `width`

`类型: length`

`default: 1.5em`
>该参数用于设置小方格的宽度

#### `gap`

`类型: length`

`default: 0pt`

>该参数用于设置小方格间的间距

#### `body`

`类型: str | content`

`default: ""`

>该参数用于设置小方格内的文字内容