# `question` 方法

该方法用于生成题目

### 示例
```typst
#question[
  $(1 + 5i)i$ 的虚部为 #paren[]
  #choices(-1, 0, 1, 6)
]
// 输出
1. (1 + 5i)i 的虚部为(  )
 A. -1     B. 0     C. 1     D. 6
```
### 参数

#### `first-line-indent`

`类型: length`

`默认值: 0em`

>该参数用于设置题目和题号间的间隔

::: tip
该参数在 <Badge type="warning" text="0.2.8" /> 之前，名为 `body-indent` 。
:::

#### `indent`

`类型: length`

`默认值: 0em`

>该参数用于设置题目的缩进

#### `hanging-indent` <Badge type="warning" text="0.2.8" />

`类型: length`

`默认值: auto`

>该参数用于设置非首行缩进

#### `line-height`

`类型: length`

`默认值: auto`

>该参数用于设置题目内容的行与行之间的距离

#### `label`

`类型: str | function`

`默认值: auto`

>该参数用于设置题号的类型

::: tip
若要修改题号类型，可参考官方文档 [numbering](https://typst.app/docs/reference/model/numbering/) 的参数设置。
:::

示例

```typst
#question(label:"①")[
  $(1 + 5i)i$ 的虚部为 #paren[]
  #choices(-1, 0, 1, 6)
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

`默认值: 400`

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

#### `points-separate` <Badge type="warning" text="0.1.3" />

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
该参数在 <Badge type="warning" text="0.1.3" /> 版本之前，名为 `points-separate-par` 。
:::

#### `points-prefix`

`类型: str`

`默认值: h(-0.45em, weak:true) + "（"`

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

#### `with-heading-label`

`类型: boolean`

`默认值: false`

>该参数用于设置题目是否带有标题的标签

#### `ref-on` <Badge type="warning" text="0.3.0" />

`类型: boolean`

`默认值: false`

>该参数用于设置题目是否生成可被引用的 label ；若设为 `true` ，则题目将对应生成一个可被引用的 label，值为：`当前章节-小节-题号` ； 没有小节时，则小节不显示

示例

```typst
= 小节
#question(ref-on:true)[]
@1-1-1

#question(ref-on:true)[]
@1-1-2
```

::: warning
1. 若在同一个文档中排版多套试卷，且要使用引用标签，必须在对应试卷中调用  [chapter](/reference/chapter) 方法。或者手动更新 [chapter 的计数器](/reference/counter#counter-chapter)，否则引用时将报错!

2. 不能在同一个小节重置多次题号。否则会报以下错误： `label xxx occurs multiple times in the document`。事实上，在同一个小节里，题号不应该被反复重置。
```typst
#let question = question.with(ref-on:true)

= 1
#question[]

#counter-question.update(0)
#question[]

// 这里引用还是会报错，原因是在同一个小节重置题号
@1-1-1

// 正确的打开方式
= 1
#question[]

= 2
#counter-question.update(0)
#question[]

@1-1-1 // 引用第1小节的第1道题
@1-2-1 // 引用第2小节的第1道题

// 在不同子小节中重置题号也是可以的
= 1
#question[]

== 1.1
#counter-question.update(0)
#question[]
#question[]

== 1.2
#counter-question.update(0)
#question[]
#question[]

@1-1.1-1
@1-1.2-1

```
:::

#### `show-ref-prefix` <Badge type="warning" text="0.3.1" />

`类型: boolean`

`默认值: true`

>该参数用于设置可被引用的 label 在编译后的显示是否带有章节-小节前缀

示例

```typst
#question(ref-on: true)[]
@1-1

// 输出： 1 - 1

#question(ref-on: true,show-ref-prefix: false)[]
@1-1

// 输出： 1
```


#### `supplement` <Badge type="warning" text="0.3.0" />

`类型: str | content | function | none`

`默认值: none`

>该参数用于设置被引用 label 的前缀

示例

```typst
#question(ref-on:true, supplement:"题")[]
@1-1
// 输出：题 1 - 1

#question(ref-on:true)[]
@1-2
// 输出：1 - 2
```



#### `body`

`类型: content`

`默认值: 无`

>该参数为位置参数，题目的内容