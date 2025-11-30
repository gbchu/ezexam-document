# `underdot` 方法 <Badge type="warning" text="^0.2.0" />

该方法可为文本添加着重号

::: waring
  该方法在 <Badge type="warning" text="^0.2.5" /> 已废弃  如需给指定的中文加着重号，只需要使用 * 包裹即可。

例: *中国*
:::

#### 示例
```typst
#underdot("重点") or #underdot[重点]
```

### 参数

#### `body`

`类型: str | content`

`默认值: 无`

>该参数为位置参数，添加着重号的文本
