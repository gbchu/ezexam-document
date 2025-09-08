# `height-content方法`
>该方法是为了解决当 [question](https://ezexam.pages.dev/question) 方法或者 [solution](https://ezexam.pages.dev/solution) 方法的内容中有比较高的公式的时候，题号和内容之间对不齐的问题；使用该方法可以做到完美控制

![效果图](/hc3.png)
### 参数及其默认值

#### `top`

`type: length`

`default: 0pt`

>该参数用于设置内容的的上间距，一般为负值；因为内容和题目或解析对不齐，是因为公式太高，会导致内容下移

#### `line-height`

`type: length`

`default: 0pt`

>该参数用于设置内容的行高

#### `body`

`type: str | content`

`default: ""`

>内容，该参数为位置参数

```typst
// 在question中的使用方法
// question中的top值和height-content中的top值刚好相反；二者必填，否则不生效
// line-height 的值自行调节到合适大小

#question[
  一个箱子里有 5 个球，分别以 1$~$5 标号，若有放回取三次，记至少取出一次的球的个数 $X$，则 $E(X) =$#fillin[].
]

#question(top: 53pt)[
    // 要调节的内容
  #height-content(
    top: -53pt,
    line-height: 30pt,
  )[方程$cases(x=sin theta, y=-1+cos theta, z=2sin display(theta/2))$表示的曲面的一般方程？$cases(x=sin theta, y=-1+cos theta, z=2sin display(theta/2), x, y, x)$#lorem(
      16,
    )]

    // 后续内容
    #lorem(30)
]
```

![效果图](/hc2.png)


```typst
// 在solution中的使用方法
// margin-top的值和top的值刚好相反；二者必填，否则不生效
// line-height 的值自行调节到合适大小

#solution(title: "解析", margin-top: 53pt)[
  // 要调节的内容
  #height-content(
    top: -53pt,
    line-height: 30pt,
  )[方程$cases(x=sin theta, y=-1+cos theta, z=2sin display(theta/2))$表示的曲面的一般方程？$cases(x=sin theta, y=-1+cos theta, z=2sin display(theta/2), x, y, x)$#lorem(
      16,
    )]

  // 后续内容
  #lorem(150)
]
```

![效果图](/hc1.png)

::: tip
以上的例子中，`#height-content` 方法的参数 `line-height` 的值无论怎么变，后续内容的行高都不会变；不使用该方法而直接改变 `question` 方法或者 `solution` 方法的参数 `line-height` 值，虽然也可以解决题号和内容对不齐的问题。但会改变后续内容的行高，这可能不是你想要的！
:::

```typst
// 直接调节line-height 的值
#question(line-height: 100pt, top: 50pt)[
  方程$cases(x=sin theta, y=-1+cos theta, z=2sin display(theta/2))$表示的曲面的一般方程？$cases(x=sin theta, y=-1+cos theta, z=2sin display(theta/2), x, y, x)$
  #lorem(50)
]
```

![效果图](/hc4.png)