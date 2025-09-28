# `ai-struct` 方法
该方法用于生成原子、离子结构式

#### 示例
```typst
#ai-struct(proton: 16, electrons: (2, 8, 6))
```
![效果图](/4.png)

```typst
#ai-struct(proton: "z", electrons: (2, 8, 8, "X"))
```
![效果图](/5.png)

#### 参数

#### `proton`

`类型: int | str | content`

`默认值: 0`

>该参数用于设置质子数或要显示的文字内容

::: tip
`ai` 是 `atomic` 和 `ion` 的缩写。
:::

#### `electrons`

`类型: array`

`默认值: ()`

>该参数用于设置核外电子

