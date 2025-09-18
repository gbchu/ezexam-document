# `exam-info` 方法

该方法用于设置试卷信息，例如出卷人，审题人，时间，分值等

#### 示例
```typst
#exam-info()
// 输出
时间：120分钟       满分：150分

#exam-info(info: (时间: "75分钟", 满分: "100分"))
// 输出
时间：75分钟       满分：100分

#exam-info(info: (命题人: "张三  李四  王五", 审题人: "老王"))
// 输出
命题人：张三  李四  王五       审题人：老王

```

### 参数及其默认值

#### `info`

`type: dictionary`

`default: (
    时间: "120分钟",
    满分: "150分",
  )`

#### `font`

`type: str | dictionary`

`default: ("New Computer Modern Math", "simhei")`

>该参数用于设置字体；

#### `size`

`type: length`

`default: 11pt`

>该参数用于设置字体的大小

#### `weight`

`type: int | str`

`default: bold`

>该参数用于设置字体的粗细

#### `gap`

`type: length`

`default: 2em`

>该参数用于设置信息之间的间距

#### `top`

`type: length`

`default: 0pt`

>该参数用于设置上间距

#### `bottom`

`type: length`

`default: 0pt`

>该参数用于设置下间距