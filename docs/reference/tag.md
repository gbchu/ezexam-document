# tag 方法 <Badge type="warning" text="^0.2.5" />

该方法可生一个带有颜色的标记

#### 示例
```typst
#tag[2025新高考I卷]#lorem(20)
```
![效果图](/tag.png)
### 参数

#### `color`

`类型: color`

`默认值: blue`

>该参数用于设置标记的颜色

#### `font`

`类型: str | auto | array`

`默认值: auto`

>该参数用于设置标记的字体

#### `weight` <Badge type="warning" text="^0.2.8" />

`类型: str | int`

`默认值: 400`

>该参数用于设置标记的粗细

#### `prefix`

`类型: str`

`默认值: "【"`

>该参数用于设置标记的前缀

#### `suffix`

`类型: str`

`默认值: "】"`

>该参数用于设置标记的后缀

#### `dx` <Badge type="warning" text="^0.2.8" />

`类型: length`

`默认值: - 0.4em`

>该参数用于设置标记的水平偏移

#### `body`

`类型: str | content`

`默认值: 无`

>该参数为位置参数，设置内容