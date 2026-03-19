# 计数器

本模版自定义了一些计数器常量，若需要自定义计数器，可通过下列提供的计数器自行修改。

### 题号

#### `counter-question`

`类型: counter`

示例
```typst
// 将题号恢复到从 1 开始
#counter-question.update(0)
```

### 章节

#### `counter-chapter`

`类型: counter`

示例

```typst
// 将章节计数器加 1
#counter-chapter.step()
```

### 标题

#### `counter-title`

`类型: counter`

示例

```typst
// 获取当前文档标题的个数
#counter-title.final().first()
```

::: warning
一定要确保自己有修改计数器的需求，否则不建议修改计数器！
:::