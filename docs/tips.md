# 使用技巧

### 方法的全局配置
全局配置全部暴露在 `setup` 方法中，像 `choices` 或 `question` 等方法中的一些配置并没有暴露在 `setup` 方法中。此时若想全局配置某些参数，可以按照以下的方法配置。比如选项的 `label` 我想使用带圈数字，不想使用默认的 `A.B.C.D.`
```typst
// 全局设置选项的label
#let choices = choices.with(label:"①")

#choices(
  [选项1],
  [选项2],
  [选项3],
  [选项4],
)

// 输出结果
① 选项1       ② 选项2         ③ 选项3         ④ 选项4
```


### 题号错位问题

  当题目中的公式比较高时，题号和内容会错位，若是在 `question` 中遇到，则需要调整其参数 `padding-top`、 `top` 的值。如果是在 `solution` 方法中，则需要调整其参数 `padding-top`、 `inset`  的 `top` 值



`question` 案例
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

`solution` 案例
```typst

// 修改之前的代码
  #solution(title: "解析")[
    $"解：原式" &=∫(1+cos 2x)/2 d x = 1/2 ∫(1+cos 2x)d x =
    1/2(∫1d x+ ∫cos 2x d x)\ &=1/2(x+∫cos 2x d x)=1/2(x+1/2 ∫cos 2x d 2x)\ &=1/2 (x+1/2
      sin 2x)=1/2 x+1/4 sin 2x+c$
  ]
```

![效果图](/tips1.png)

```typst

// 修改之后的代码
  #solution(inset: (top: 30pt),padding-top: 7pt, title: "解析")[
   $"解：原式" &=∫(1+cos 2x)/2 d x = 1/2 ∫(1+cos 2x)d x =
    1/2(∫1d x+ ∫cos 2x d x)\ &=1/2(x+∫cos 2x d x)=1/2(x+1/2 ∫cos 2x d 2x)\ &=1/2 (x+1/2
      sin 2x)=1/2 x+1/4 sin 2x+c$
  ]
```

![效果图](/tips2.png)




