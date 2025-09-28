# `answer` 方法

问题的答案；通常配合 [`solution`](https://ezexam.pages.dev/solution) 方法使用

#### 示例
```typst
#answer("D") or #answer[D]
// solution方法中
#solution[
  #answer[D]
]
```
效果： <font color="maroon">答案：D</font>
### 参数

#### `color`

`类型: color`

`默认值: maroon`

>该参数用于设置答案的文本颜色

#### `body`

`类型: str | content`

`默认值: 无`

>该参数为位置参数，用于设置答案的内容