# `paren` 方法

该方法为选择题的小括号

#### 示例
```typst
下列说法正确的是 #paren[]

// 输出
下列说法正确的是（    ）

下列说法正确的是 #paren[A]

// 输出（只有在显示答案为真时才会显示）
下列说法正确的是（  A  ）

下列说法正确的是 #paren(justify: true)[A]
// 输出
下列说法正确的是           （  A  ）

下列说法正确的是BALABALABAL #paren(justify: true)[A]
// 输出
下列说法正确的是BALABALABAL（  A  ）
```

### 参数

#### `justify`

`type: boolean`

`default: false`

>该参数用于设置括号是否两端对齐

#### `placeholder`

`type: str | symbol`

`default: "▲"`

>该参数用于设置当不显示答案时，括号的占位符
::: tip
占位符的样式修改参考官方文档：[符号](https://typst.app/docs/reference/symbols/)
:::

#### `with-number`

`type: boolean`

`default: false`
>该参数用于设置占位符是否使用当前题号替代

```typst
<!-- 使用方法 -->
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor#paren(with-number: true)[] incididunt ut
labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamusr#paren(with-number: true)[] animo, cum
corpore dolemus, fieri tamen permagna accessio potest, si aliquod aeternum et infinitum impenderer#paren(
  with-number: true,
)[] malum nobis opinemur. Quod idem licet transferre in voluptatem, ut postea variari voluptas distinguique possit,
augerir#paren(with-number: true)[] amplificarique non possit. At etiam Athenis, ut e patre audiebam facete et urbane
Stoicos irridente, statua est in quo a nobis philosophia defensa et collaudatar#paren(with-number: true)[] est, cum id,
quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem
quibusdame.
#question[
  #choices(
    [test],
    [test],
    [test],
    [test],
  )
]
#question[
  #choices(
    [test],
    [test],
    [test],
    [test],
  )
]
#question[
  #choices(
    [test],
    [test],
    [test],
    [test],
  )
]
#question[
  #choices(
    [test],
    [test],
    [test],
    [test],
  )
]
#question[
  #choices(
    [test],
    [test],
    [test],
    [test],
  )
]
```

::: tip
该选项一般用在类似英语中的完型填空等题型中
:::

#### `update`

`type: boolean`

`default: false`
>该参数用于更新题号


::: warning
只有 `with-number` 设置为 `true` 且当前题目在编写类似英语中七选五的题型时，才必须将该参数设置为 `true` ，否则题号将不会对应更新！！！如果没有该需求，忽略该参数
:::

```typst
<!-- 使用方法 -->
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor#paren(with-number: true, update: true)[]
incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamusr#paren(
  with-number: true,
  update: true,
)[] animo, cum corpore dolemus, fieri tamen permagna accessio potest, si aliquod aeternum et infinitum
impenderer#paren(with-number: true, update: true)[] malum nobis opinemur. Quod idem licet transferre in voluptatem, ut
postea variari voluptas distinguique possit, augerir#paren(with-number: true, update: true)[] amplificarique non
possit. At etiam Athenis, ut e patre audiebam facete et urbane Stoicos irridente, statua est in quo a nobis philosophia
defensa et collaudatar#paren(with-number: true, update: true)[] est, cum id, quod maxime placeat, facere possimus,
omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdame.
#choices(
  [test],
  [test],
  [test],
  [test],
  [test],
  [test],
  [test],
)

```
::: tip
 对于七选五这类题型，每次使用占位符都设置参数很麻烦，本模板提供了一个方法 `parenn` ，只需要将上述 `paren(with-number: true, update: true)[]` 直接改为 `parenn[]` 即可，本质就是上述方法的语法糖
:::

#### `answer`

`type: content`

>该参数为位置参数，显示答案