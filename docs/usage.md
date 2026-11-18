# 快速开始
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  本模板可以快速且高效的排版常见的小、初、高、大学试卷，只需一会儿就可以排版出一份精美的试卷。

 1. **在线使用**

     + 使用 [官方web](https://typst.app)

 2. **本地使用**

     + 使用 [vscode](https://code.visualstudio.com/download) 并安装插件 [tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)

```typst
// demo.typ
#import "@preview/ezexam:0.4.0": *  // 导入模版
#show: setup.with(mode: EXAM, paper: a3) // 应用模版

#title[ezexam]

= 选择题
#question[
  题干 #paren[]
  #choices([选项1],[选项2],[选项3],[选项4])
]

= 填空题
#question[
  题干 #fillin[].
]

= 解答题
#question[
  题干.
  + 问题 1
  + 问题 2
]

```

::: tip
由于官方审核模板较慢，若想尽早使用最新版，可使用以下命令将最新版下载到本地使用。
:::

**macOS / Linux / WSL**
```bash
curl -fsSL https://ezexam.pages.dev/install.sh | bash
```

**Windows**
```powershell
irm https://ezexam.pages.dev/install.ps1 | iex
```

如果对你有帮助，请作者喝杯奶茶！❤

<img src="/wechatpay.png" width = "200" alt = "微信收款码"/>