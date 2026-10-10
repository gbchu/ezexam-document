# 使用技巧

### 方法的全局配置
全局配置全部暴露在 `setup` 方法中，像 `choices` 、 `question` 等方法中的一些配置并没有暴露在 `setup` 方法中。若要全局配置方法中的某些参数，可以按照以下的方法配置。

例如：选项的 `label` 使用带圈数字，不使用默认的 `A. B. C. D.`
```typst
// 全局设置选项的label
#let choices = choices.with(label:"①")

// 后续所有的选项的label默认都将使用带圈数字
#choices(
  [选项1],
  [选项2],
  [选项3],
  [选项4],
)
// 输出结果
① 选项1       ② 选项2         ③ 选项3         ④ 选项4
```

###  AI
为了方便结合 AI 快速使用本模版进行排版，特地写了一个 [ezexam-skill](/exexam-skill.md){download="ezexam-skill.md"} ，使用方法有以下 2 种

::: tip
1. 半自动（免费）：将 skill 发送给 AI ，然后将你要排版的试题，讲义等图片或文档发送给支持多模态的 AI （豆包、千问、deepseek 等），然后对 AI 说 “排版” ，AI 会生成对应的 `typst` 代码。

2. 全自动（付费）：使用 agent (codex、workbuddy 等) 可以做到全自动生成对应的 `typst` 文件！无需手动复制代码到 typ 文件。
:::




