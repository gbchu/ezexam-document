# `title` 方法

该方法设置文档的标题

#### 示例
```typst
#title("母猪的产后护理") or #title[母猪的产后护理]
```

### 参数

#### `body`

`类型: str | content`

`默认值: 无`

>该参数为位置参数，用于设置标题名

#### `font`

`类型: str | dictionary`

`默认值: auto`

>该参数用于设置标题的字体

#### `size`

`类型: length`

`默认值: auto`

>该参数用于设置标题字体的大小

#### `weight`

`类型: int | str`

`默认值: 700`

>该参数用于设置标题字体的粗细

#### `color`  <Badge type="warning" text="^0.1.7" />

`类型: color`

`默认值: black`

>该参数用于设置标题的颜色

#### `position`

`类型: alignment`

`默认值: center`

>该参数用于设置标题的对齐方式

#### `top`

`类型: length`

`默认值: 0pt`

>该参数用于设置标题的上间距

#### `bottom`

`类型: length`

`默认值: 18pt`

>该参数用于设置标题的下间距
