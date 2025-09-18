# `secret` 方法

#### 示例
```typst
#secret()
// 输出
绝密★启用前

#secret(body: "★绝密★")
// 输出
★绝密★
```

#### 参数及其默认值
`body`

`type: str | content`

`default: 绝密★启用前`

>该参数用于设置保密级，位置在左上角