# `emph-dot` 方法 <Badge type="warning" text="0.3.2" />

该方法可为文本添加着重号

#### 示例
```typst
#emph-dot[重点]

// 若文本中包含非中文，中文与非中文之间的空格会被忽略。
#emph-dot[abc中文abc]
// 效果
abc中文abc

// 解决办法
#emph-dot[abc 中文 abc]

abc#emph-dot[ 中文 ]abc

abc #emph-dot[中文] abc

// 效果
abc 中文 abc
```

::: warning
  在 <Badge type="warning" text="0.2.5" /> ～ <Badge type="warning" text="0.3.1" /> 版本中，如需给指定的中文加着重号，需要使用 * 包裹。

例: \*中国\*

但上述方式有 bug，已被废弃，不建议使用。
:::

### 参数

#### `body`

`类型: str | content`

`默认值: 无`

>该参数为位置参数，要添加着重号的文本
