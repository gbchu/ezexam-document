# `question` 方法

该方法用于生成题目

### 示例
```typst
#question[
  $(1 + 5i)i$ 的虚部为 #paren[]
  #choices([$-1$], [$0$], [$1$], [$6$])
]
// 输出
1. (1 + 5i)i 的虚部为(  )
 A. -1     B. 0     C. 1     D. 6
```
### 参数
#### `body-indent`

`类型: length`

`默认值: 0.6em`
>该参数用于设置题目和题号间的间隔

#### `indent`

`类型: length`

`默认值: 0pt`
>该参数用于设置题目的缩进

#### `line-height`

`类型: length`

`默认值: auto`
>该参数用于设置题目内容的行高，当题目中的公式比较高时，题号和题目内容会错位，这时可以通过该参数来微调。
:::warning
该参数虽然可以对齐，但会导致内容的每一行与行之间的间隔变大。从 <Badge type="info" text="0.1.7" /> 开始已弃用，推荐 [修复题号对不齐](#padding-bottom) 代替
:::

#### `label`

`类型: str | function`

`默认值: auto`
>该参数用于设置题号的类型
::: tip
若要修改题号类型，可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置
:::

示例

```typst
#question(label:"①")[
  $(1 + 5i)i$ 的虚部为 #paren[]
  #choices([$-1$], [$0$], [$1$], [$6$])
]
// 输出
① (1 + 5i)i 的虚部为(  )
 A. -1     B. 0     C. 1     D. 6
```

#### `label-color`

`类型: color`

`默认值: black`
>该参数用于设置题号的颜色

#### `label-weight`

`类型: str | int`

`默认值: regular`
>该参数用于设置题号字体的粗细

#### `points`

`类型: none | int`

`默认值: none`
>该参数用于设置题目的分值

示例

```typst
#question(points: 5)[
  安得广厦千万间，大庇天下寒士俱欢颜
]

// 输出
1.(5分)
  安得广厦千万间，大庇天下寒士俱欢颜
```

#### `points-separate`

`类型: boolean`

`默认值: true`
>该参数用于设置题目的分值是否独占一行

示例

```typst
#question(points: 5, points-separate: false)[
  安得广厦千万间，大庇天下寒士俱欢颜
]

// 输出
1.(5分)安得广厦千万间，大庇天下寒士俱欢颜
```

::: tip
该参数在 <Badge type="warning" text="0.1.3" /> 版本之前，名为 `points-separate-par`；
:::

#### `points-prefix`

`类型: str`

`默认值: "（"`
>该参数用于设置题目分值前缀

示例

```typst
#question(points: 5, points-prefix: "🧡")[
  安得广厦千万间，大庇天下寒士俱欢颜
]

// 输出
1.🧡5分)
  安得广厦千万间，大庇天下寒士俱欢颜
```

#### `points-suffix`

`类型: str`

`默认值: "分）"`
>该参数用于设置题目的分值后缀

示例

```typst
#question(points: 5, points-suffix: "🧡")[
  安得广厦千万间，大庇天下寒士俱欢颜
]

// 输出
1.（5🧡
  安得广厦千万间，大庇天下寒士俱欢颜
```

#### `top`

`类型: length`

`默认值: 0pt`
>该参数用于设置题目距离上方的外边距

#### `bottom`

`类型: length`

`默认值: 0pt`
>该参数用于设置题目距离下方的外边距

#### `padding-top`

`类型: length`

`默认值: 0pt`
>该参数用于设置题目上方内边距

#### `padding-bottom`

`类型: length`

`默认值: 0pt`
>该参数用于设置题目的下方内边距

::: tip
`padding-top` 和 `padding-bottom` 参数是用来解决题号和题目对不齐的问题；如遇到该问题可调节该参数
:::

示例

```typst
// 修改之前的代码
#question[
  已知行列式$mat(1, 2, a; 0, 1, -1; 3, 4, 5)$的代数余子式$C_21$ 值为2，求$a$的值
]
```

![效果图](/tips3.png)


```typst
// 修改之后的代码
#question(top: 14pt,padding-top: -6.5pt)[
  已知行列式$mat(1, 2, a; 0, 1, -1; 3, 4, 5)$的代数余子式$C_21$ 值为2，求$a$的值
]
```
![效果图](/tips4.png)

#### `with-heading-label`

`类型: boolean`

`默认值: false`
>该参数用于设置题目是否带有标题的标签

#### `body`

`类型: content`
>该参数为位置参数，题目的内容