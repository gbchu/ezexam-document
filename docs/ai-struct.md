# `ai-struct` 方法

#### 参数及其默认值

#### `proton`

`type: int | str | content`

`default: 0`

>该参数用于设置质子数或要显示的文字内容
::: tip
`ai` 是 `atomic` 和 `ion` 的缩写
:::

#### `electrons`

`type: dictionary`

`default: ()`

>该参数用于设置核外电子

#### 示例
```typst
#ai-struct(proton: 16, electrons: (2, 8, 6))
```
![效果图](4.png)

```typst
#ai-struct(proton: "z", electrons: (2, 8, 8, "X"))
```
![效果图](5.png)