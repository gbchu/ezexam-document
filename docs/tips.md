# 使用技巧

+ 全局配置全部暴露在 `setup` 方法中，像 `choices` 或 `question` 等方法中的一些配置并没有暴露在 `setup` 方法中。此时若想全局配置某些参数，可以按照以下的方法配置。比如选项的 `label` 我想使用带圈数字，不想使用默认的 `A.B.C.D.`
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


+ 关于公式内容较高的解决方法

  当题目中的公式比较高时，题号和题目内容会错位，这时可以将题目的内容放在一个 `box` 中，并设置 `box` 的参数 `inset`  的 `top` 值微调即可。此时题号和题目对齐；但该公式可能会将上下的内容遮挡！此时还需要调整 `question` 方法的 `top` 值。如果是在 `solution` 方法中，则需要修改  `solution` 方法的 `inset`  的 `top` 值

修改之前的代码及效果：
```typst
// 案例
  求积分$∫cos^2x d x$
  #solution[
    $"解：原式" &=∫(1+cos 2x)/2 d x = 1/2 ∫(1+cos 2x)d x =
    1/2(∫1d x+ ∫cos 2x d x)\ &=1/2(x+∫cos 2x d x)=1/2(x+1/2 ∫cos 2x d 2x)\ &=1/2 (x+1/2
      sin 2x)=1/2 x+1/4 sin 2x+c$
  ]
```
![效果图](/tips1.png)

修改之后的代码及效果：
```typst
// 案例
  求积分$∫cos^2x d x$
  #solution(inset: (top: 30pt))[
    #box(inset: (top: 7pt))[$"解：原式" &=∫(1+cos 2x)/2 d x = 1/2 ∫(1+cos 2x)d x =
    1/2(∫1d x+ ∫cos 2x d x)\ &=1/2(x+∫cos 2x d x)=1/2(x+1/2 ∫cos 2x d 2x)\ &=1/2 (x+1/2
      sin 2x)=1/2 x+1/4 sin 2x+c$]
  ]
```
![效果图](/tips2.png)
