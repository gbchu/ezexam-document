# `fillin` 方法

该方法为填空题的下划线

#### 示例
```typst
与 NaOH 溶液反应生成酸式盐的化学方程式为 #fillin(length: 1in)[]
// 输出
与 NaOH 溶液反应生成酸式盐的化学方程式为__________________

```


### 参数及其默认值

#### `length`

`type: length`

`default: 1em`

>该参数用于设置填空题下划线的长度

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

::: tip
该选项一般用在类似英语中的完型填空等题型中
:::

```typst
<!-- 使用方法 -->
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor#fillin(with-number: true)[] incididunt ut
labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamusr#fillin(with-number: true)[] animo, cum
corpore dolemus, fieri tamen permagna accessio potest, si aliquod aeternum et infinitum impenderer#fillin(
  with-number: true,
)[] malum nobis opinemur. Quod idem licet transferre in voluptatem, ut postea variari voluptas distinguique possit,
augerir#fillin(with-number: true)[] amplificarique non possit. At etiam Athenis, ut e patre audiebam facete et urbane
Stoicos irridente, statua est in quo a nobis philosophia defensa et collaudatar#fillin(with-number: true)[] est, cum id,
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

#### `update`

`type: boolean`

`default: false`
>该参数用于更新题号

::: warning
只有 `with-number` 设置为 `true` 且当前题目在编写类似英语中七选五的题型时，才必须将该参数设置为 `true` ，否则题号将不会对应更新！！！如果没有该需求，忽略该参数
:::

```typst
<!-- 使用方法 -->

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor#fillin(with-number: true, update: true)[]
incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamusr#fillin(
  with-number: true,
  update: true,
)[] animo, cum corpore dolemus, fieri tamen permagna accessio potest, si aliquod aeternum et infinitum
impenderer#fillin(with-number: true, update: true)[] malum nobis opinemur. Quod idem licet transferre in voluptatem, ut
postea variari voluptas distinguique possit, augerir#fillin(with-number: true, update: true)[] amplificarique non
possit. At etiam Athenis, ut e patre audiebam facete et urbane Stoicos irridente, statua est in quo a nobis philosophia
defensa et collaudatar#fillin(with-number: true, update: true)[] est, cum id, quod maxime placeat, facere possimus,
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
 对于七选五这类题型，每次使用占位符都设置参数很麻烦，本模板提供了一个方法 `fillinn` ，只需要将上述 `fillin(with-number: true, update: true)[]` 直接改为 `fillinn[]` 即可，本质就是上述方法的语法糖
:::

#### `answer`

`type: content`

>该参数为位置参数，显示答案