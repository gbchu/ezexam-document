# `e-bridge` 方法

该方法用于生成单线桥、双线桥

### 示例


```typst
// 双线桥
#e-bridge(
  equation: [K] + [Cl<A>O#sub[3] + 6H] + [Cl<B> = KCl + 3] + [Cl<C>#sub[2]$arrow.t$ + 3H#sub[2]O],
  get: (from: <A>, to: <C>, e: 5, tsign: none),
  lose: (from: <B>, to: <C>, e: 5),
)
```
![效果图](/1.png)


```typst
// 单线桥
#e-bridge(
  equation: [Cu<A2>O + H<A1>#sub[2] = Cu + H#sub[2]O],
  get: (from: <A1>, to: <A2>, e: 2, tsign: none),
)
```
![效果图](/2.png)

```typst
// 单线桥
#e-bridge(
  equation: [Cl<B1>#sub[2] + 2NaOH = NaCl + NaClO + H#sub[2]O],
  get: (from: <B1>, to: <B1>, e: 1, tsign: none),
)
```
![效果图](/3.png)

### 参数

#### `equation`

`类型: str | content`

`默认值: ""`

>该参数用于设置化学方程式

#### `get`

`类型: dictionary`

`默认值: (from: "", to:."", e: 0, tsign: "×")`

>该参数用于设置得电子的信息. `from` : 从哪一个原子开始，填写对应的 `label` ; `to` : 到哪一个原子结束，填写对应的 `label` ; `e` : 转移电子数; `tsign` : 电子连接符号

#### `lose`

`类型: dictionary`

`默认值: (from: "", to:."", e: 0, tsign: "×")`

>该参数用于设置失电子的信息. `from` : 从哪一个原子开始，填写对应的 `label` ;  `to` : 到哪一个原子结束，填写对应的 `label` ; `e` : 转移电子数; `tsign` : 电子连接符号

#### `color`

`类型: color`

`默认值: black`

>该参数用于设置指向箭头的颜色

#### `thickness`

`类型: length`

`默认值: 0.5pt`

>该参数用于设置指向箭头的粗细

#### `spacing`

`类型: length`

`默认值: 2pt`

>该参数用于设置指向箭头、方程式、转移电子数之间的间距

:::warning
1. 在给化学方程式标注 `label` 时，要确保该 `label` 唯一，否则会出现错误
2. 单线桥应始终使用 `get` 参数，否则指向箭头将不会出现
:::