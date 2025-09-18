# `score` 方法
>该方法为解析里的评分
#### 示例
```typst
安得广厦千万间，大庇天下寒士俱欢颜 #score(2)

```
效果：

  安得广厦千万间，大庇天下寒士俱欢颜 <font color="maroon">........................2分</font>

### 参数及其默认值

#### `score-prefix`

`type: str`
`default: ""`
>该参数用于设置分数的前缀

#### `score-suffix`

`type: str`
`default: "分"`
>该参数用于设置分数的后缀

#### `color`

`type: color`
`default: maroon`
>该参数用于设置分数的颜色

#### `points`

>该参数为位置参数，分值
