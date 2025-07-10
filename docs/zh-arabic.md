# `zh-arabic方法`
>该方法返回一个函数，用来设置页面页码的格式.是在使用 `setup` 方法时，传递给 `page-numbering` 参数的,在 `EXAM` 模式下默认调用该方法。
>
>格式为：`"XX  第X页（共XX页）"`
### 参数及其默认值

#### `prefix`

`type: str`

`default: ""`

>该参数用于设置页码的前缀

#### `suffix`

`type: str`

`default: 试题`

>该参数用于设置页码的后缀

```typst
  例如：
  zh-arabic("SSS", "试题")
  最终格式化后的页码效果： SSS科目试题 第X页（共XX页）
```