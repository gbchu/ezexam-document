# 快速开始
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  本模板可以快速且高效的排版常见的小、初、高、大学试卷，只需一会儿就可以排版出一份精美的试卷。

 1. **在线使用**

     + 使用 [官方web](https://typst.app)

 2. **本地使用**

     + 使用 [vscode](https://code.visualstudio.com/download) 并安装插件 [tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)

```typst
// demo.typ
#import "@preview/ezexam:0.4.0": *  // 导入模版
#show: setup.with(mode: EXAM, paper: a3) // 应用模版配置

#title[ezexam]

= 选择
#question[
  $(1 + 5"i")"i"$ 的虚部为 #paren[]
  #choices(-1, 0, 1, 6)
]

......

= 填空
#question[
  若直线 $y = 2x +5$ 是曲线 $y = e^x + x + a$ 的切线，则 $a$= #fillin[].
]

......

```

::: tip
模版早期版本存在一些 bug ，新版已经修复和优化；推荐使用最新版本。
:::

如果对你有帮助，请作者喝杯奶茶！❤

<img src="/wechatpay.png" width = "200" alt = "微信收款码"/>