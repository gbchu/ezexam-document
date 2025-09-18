# `answer` 方法

问题的答案；通常配合 `solution` 方法使用

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

#### `body`
`类型: str | content`

`默认值: ""`
