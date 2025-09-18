# `exam-type` 方法
> 该方法用于设置试卷类型
#### 示例
```typst
#exam-type("A") or #exam-type[A]
// 输出
试卷类型: A

#exam-type("A", prefix: "类型：") or #exam-type(prefix: "类型：")[A]
// 输出
类型: A

```


### 参数及其默认值

#### `type`
`body: str | content`

`default: ""`
>该参数为位置参数，用于设置试卷类型

#### `prefix`

`type: str | content`

`default: 试卷类型:`

>该参数用于设置试卷类型的前缀，位置默认在右上角
