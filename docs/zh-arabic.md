# `zh-arabic` 方法

该方法返回一个函数，用来设置页面页码的格式.是在使用 `setup` 方法时，传递给 `page-numbering` 参数的，在 `EXAM` 模式下默认调用该方法。

#### 示例
```typst
#zh-arabic()

// 输出
第xx页（共xx页）
```

### 参数

#### `prefix`

`类型: str`

`默认值: ""`

>该参数用于设置页码的前缀

```typst
#zh-arabic(prefix: "🧡")
// 输出
🧡 第xx页（共xx页）
```

#### `suffix`

`类型: str`

`默认值: ""`

>该参数用于设置页码的后缀

```typst
#zh-arabic( suffix: "🌼")
// 输出
第xx页（共xx页）🌼
```