# `score-box` 方法

该方法用于绘制一个评分框

#### 示例
```typst
#score-box()
```

效果：

| 得分 |    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; |
|------|-------|
| 阅卷人 |   &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;   |


### 参数

#### `x`

`类型: length`

`默认值: 0pt`
>该参数用于设置水平方向上的偏移

#### `y`

`类型: length`

`默认值: 0pt`

>该参数用于设置竖直方向上的偏移

#### `show-rater` <Badge type="warning" text="0.3.1" />

`类型: boolean`

`默认值: true`

>该参数用于设置是否显示阅卷人

#### 示例
```typst
#score-box(show-rater: false)
```

效果：

| 评分 |
|------|
| &nbsp;&nbsp;&nbsp;&nbsp; |