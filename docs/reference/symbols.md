# 符号
## 本地化

为了符合使用习惯，修改了一些符号在 `数学模式` 下的显示方式

| 符号 | 修改前 | 修改后 |
|------|------|------|
| `parallel` | \|\| | // |
| `parallel.eq` | ⋕ | <span style="display:inline-flex;flex-direction:column;line-height:1;font-size:0.9em;vertical-align:middle;text-align:center;margin:0 0.1em;"><span>//</span><span style="display: inline-block; width: 0.85em; height: 0.35em; border-top: 1.5px solid currentColor; border-bottom: 1.5px solid currentColor; margin-top: 2px;"></span></span> |
| `gt.eq`| ≥ | ⩾ |
| `lt.eq`| ≤ | ⩽ |


## 正体
#### 圆周率 `pi`

默认正体

#### 自然常数 `e` <Badge type="warning" text="0.4.0" />

使用 `eu` 强制正体

#### 虚部单位 `i` <Badge type="warning" text="0.4.0" />

使用 `iu` 强制正体

## 向量

####  `vect` <Badge type="warning" text="0.4.0" />

该方法根据输入的内容，显示不同的效果。单字母加粗，多字母加箭头

#### 示例
```typst
$vect(a) vect(A B)$
```

::: warning
该方法只在数学环境中生效！
:::
