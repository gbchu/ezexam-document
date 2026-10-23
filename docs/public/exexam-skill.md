# Skill: ezexam 试卷 / 讲义生成

## 触发约定

- 用户说“ezexam 一下”或“排版”，或发送试卷 / 讲义文档、图片时，默认按本 Skill 排版，无需额外说明。
- 若用户明确说“不按 Skill”或给出其他指令，以用户指令为准。

## 触发条件

用户要求用 `ezexam` 模板（Typst）生成试卷或讲义，或提供试卷 / 讲义文档或图片要求转成 Typst 代码。

## 一、模式与设置

- 讲义模式：默认模式，`#show: setup.with()`，不写 `mode`、不写 `paper`。
- 试卷模式：`#show: setup.with(mode: EXAM, paper: a3)`。
- 仅试卷模式用 `#subject`；讲义模式不用。

## 二、标题与编号

- 所有 `=`、`==`、`===` 标题不手写编号：
  - 不写“一、”“二、”“三、”。
  - 不写“题型1”“题型2”。
  - 不写“1.”“2.”。
  - 编号由模板自动生成。
- `#question` 不手写题号。
- 解答题小题用 `+` 自动编号，不手写“（1）（2）”。
- 解答题分值用 `points` 参数，例如 `#question(points: 13)[...]`。

## 三、数学符号

### 3.1 比较与关系

| 含义 | Typst 写法 |
|---|---|
| 不等于 | `!=`|
| 约等于 | `approx` |
| 相似 | `~`|
| 全等 | `tilde.equiv` |

### 3.2 集合与逻辑

| 含义 | Typst 写法 |
|---|---|
| 交集 | `inter` |
| 并集 | `union` |
| 补集 | `complement` |
| 空集 | `emptyset` |
| 属于 | `in` |
| 不属于 | `in.not` |
| 子集 | `subset.eq` |
| 真子集 | `subset.nequiv` |
| 母集 | `supset.eq` |
| 真 | `supset.nequiv` |
| 任意 | `forall` |
| 存在 | `exists` |
| 且 | `and` |
| 或 | `or` |
| 非 | `not` |
| 推出 | `arrow.r.double` 或 `=>` |
| 等价 | `arrow.l.r.double` 或 `<=>` |

### 3.3 常见数集

| 含义 | Typst 写法 |
|---|---|
| 实数集 | `bold(upright(R))` |
| 自然数集 | `bold(upright(N))` |
| 整数集 | `bold(upright(Z))` |
| 有理数集 | `bold(upright(Q))` |
| 复数集 | `bold(upright(C))` |
| 正整数集 | `bold(upright(N))^*` |

### 3.4 向量

| 类型 | Typst 写法 |
|---|---|
| 单字母向量 | `bold(a)`、`bold(b)` |
| 双字母向量 | `arrow(A B)`、`arrow(C D)` |

### 3.5 运算符号

| 含义 | Typst 写法 |
|---|---|
| 加减 | `plus.minus` |
| 乘 | `times` |
| 除 | `div` |
| 点乘 | `dot` |
| 圆 | `dot.o` |
| 积分 | `integral` |
| 二重积分 | `integral.double` |
| 三重积分 | `integral.triple` |
| 求和 | `sum` |
| 求积 | `product` |
| 2次方根 | `sqrt` |
| n次根号 | `root` |
| 分数 | `frac` |
| 分段函数 | `cases` |
| 极限 | `lim` |
| 微分 | `dif` |

### 3.6 希腊字母

直接使用字母名即可。例如 `alpha`、`beta`、`gamma`、`delta`、`epsilon`、`theta`、`lambda`、`mu`、`pi`、`sigma`、`phi`、`omega`、`Gamma`、`Delta`、`Theta`、`Lambda`、`Pi`、`Sigma`、`Phi`、`Omega`。

### 3.7 箭头

| 含义 | Typst 写法 |
|---|---|
| 右箭头 | `arrow.r` 或 `->` |
| 左箭头 | `arrow.l` 或 `<-` |
| 双向箭头 | `arrow.l.r` 或 `<->` |
| 长箭头 | `arrow.r.long` |
| 映射 | `arrow.r.bar` |
| 推出 | `arrow.r.double` |
| 等价 | `arrow.l.r.double` |

### 3.8 其他常用符号

| 含义 | Typst 写法 |
|---|---|
| 无穷 | `infinity` 或 `oo` |
| 角度 | `angle` |
| 垂直 | `perp` |
| 平行 | `parallel` |
| 因为 | `because` |
| 所以 | `therefore` |
| 度 | `degree` |
| 点 | `dot` |
| 省略号 | `dots.c`、`dots.h`、`dots.v` |
| 组合数 | `upright(C)_n^m` |
| 排列数 | `upright(A)_n^m` |
| 平均数 | `overline(x)` |
| 弧 | `overparen(A B)` |
| 向量a,b夹角 | `chevron.l bold(a),bold(b) chevron.r` |

### 3.9 注意事项

1.  **数学环境**：所有符号必须放在 `$...$` 中，如 `$x <= 0$`、`$A inter B$`。如果遇到虚部单位 `i` 或自然常数 `e` 要保持正体显示
3.  **希腊字母**：小写用 `alpha`，大写首字母大写 `Alpha`。
4.  **符号变体**：支持点号选择，如 `arrow.r.double.long`、`triangle.stroked.t`。

### 3.10 常用示例

```typst
// 集合与逻辑
$A inter B = emptyset$              // A ∩ B = ∅
$forall x > 0, x^2 >= 0$            // ∀x>0, x² ≥ 0
$x in bold(upright(R))$             // x ∈ ℝ
$M subset.nequiv B$                  // M ⊊ B

// 比较与关系
$a <= b$                             // a ≤ b
$a != b$                             // a ≠ b
$a ~ b$                              // a ~ b
$a approx b$                         // a ≈ b

// 向量
$bold(a) + bold(b)$                  // a + b
$arrow(A B) = arrow(C D)$           // AB = CD
$chevron.l bold(a),bold(b) chevron.r$ // ⟨𝒂,𝒃⟩
$bold(a) dot bold(b)$                // 𝒂.𝒃

// 非向量点乘
$a_n dot a_(n+1)$

// 平均数与弧
$overline(x)$                        // x̄
$overparen(A B)$                     // 弧 AB

// 运算
$sum_(i=1)^n a_i$                    // Σᵢ₌₁ⁿ aᵢ
$integral_0^1 f(x) dif x$           // ∫₀¹ f(x) dx
$frac(a + b, c - d)$                // (a+b)/(c-d)

// 圆
$dot.o M$                            // ⊙M

// 箭头与推导
$A arrow.r.double B$                 // A ⇒ B
$x arrow.r.bar x^2$                 // x ↦ x²

// 希腊字母
$alpha + beta = gamma$               // α + β = γ
$sin^2 theta + cos^2 theta = 1$     // sin²θ + cos²θ = 1

// 分段函数
$cases(x+1 comma space  & x>2, x^2 comma space  & x<=2)$

```

## 四、题型与答案

- 选择题答案用 `#paren[X]`；无答案时写 `#paren[]` 留空。
- 填空题答案用 `#fillin[...]`；无答案时写 `#fillin[]` 留空。
- 英语中的 7选5 题型使用 `#fillinn[]`  或 `#parenn[]` 留空
- 选项用 `#choices(...)`。
- 推算答案仅供参考，需提示以官方为准。
- 原卷含答案时，试卷正文不掺入答案，答案留在试卷末尾或另附。

## 五、图形

- 需要图形时用 `cetz` 按数学关系重建，不做像素级描摹。
- 导入方式：`#import "@preview/cetz:0.5.2"`，用 `#cetz.canvas(...)` 调用，内部 `import cetz.draw: *`。
- 复杂图形先说明能画到什么程度，再动手。
- 图形占位时用文字描述，不凭空编造。

## 六、输出方式

- 长文档分段输出，中途不询问，自动处理。
- 每段保持独立可用，顺序拼接即为完整文档。
- 全部输出完后，可整合成一个连续代码块。

## 七、骨架示例

### 7.1 讲义模式完整骨架

```typst
#import "@preview/ezexam:0.4.0": *

#show: setup.with()

#title[讲义标题]

= 一级标题

== 二级标题

#question[
  题干 #paren[]
  #choices([选项1], [选项2], [选项3], [选项4])
]

#question[
  题干 #fillin[]
]

#question(points: 13)[
  题干……

  + 第一小问；
  + 第二小问。
]
```

### 7.2 试卷模式完整骨架

```typst
#import "@preview/ezexam:0.4.0": *

#show: setup.with(mode: EXAM)

#title[试卷标题]
#subject[数学]

#notice(
  [注意事项一。],
  [注意事项二。],
)

#set-per-pts(5,6,5,) // 设置每个小节每道题的分数

= 选择题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。在每小题给出的四个选项中，只有一项是符合题目要求的。

#question[
  题干 #paren[]
  #choices([选项1], [选项2], [选项3], [选项4])
]

= 多选题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。

#question[
  题干 #paren[]
  #choices([选项1], [选项2], [选项3], [选项4])
]

= 填空题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。

#question[
  题干 #fillin[]
]

= 解答题：本题共 #sec-q-cnt 小题，共 #sec-pts 分。解答应写出文字说明、证明过程或演算步骤。

#question(points: 13)[
  题干……

  + 第一小问；
  + 第二小问。
]
```

### 7.3 带图形的骨架

```typst
#import "@preview/ezexam:0.4.0": *
#import "@preview/cetz:0.5.2"

#question[
  如图……

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // 绘图代码
    })
  ]
]
```

### 7.4 带答案的骨架

```typst
#question[
  题干 #paren[B]
  #choices([选项1], [选项2], [选项3], [选项4])
]
```

### 八 答案排版规则（使用 `ezexam` 内置函数）：
  1. 在最前面定义：`#let answer = tag.with(prefix: "答案：", suffix: none, color: maroon)`
  2. 用 `#solution-block[...]` 包裹整个答案区。
  3. 答案区的标题直接用 `= 选择题`、`= 填空题`、`= 解答题`（不手写编号）。
  4. 每题解析用 `#solution(title: "解析")[...]` 或 `#solution[...]`。
  5. 答案用 `#answer[...]` 呈现。
  6. 解析正文以 `#tag[解析]:` 开头。
  7. 解答题需在步骤后给分时，使用 `#score(分值)`。
  8. 题干前若有来源出处（如 `[2026 届XXXX试题]`），使用 `#tag[来源名称]` 包裹。

**答案部分代码示例：**

```typst
#let answer = tag.with(prefix: "答案：", suffix: none, color: maroon)

#solution-block[
  = 选择题
  #solution(title: "解析")[
    #answer[A]

    #tag[解析]: #lorem(6)
  ]

  = 填空题
  #solution[
    #answer[6]

    #tag[解析]: #lorem(6)
  ]

  = 解答题
  #solution[
    #tag[解析]: #lorem(6) #score(5)
  ]
]
```

## 九、检查清单

生成前确认：

- [ ] 讲义模式未写 `mode`、未写 `paper`
- [ ] 试卷模式写了 `mode: EXAM`
- [ ] 标题未手写编号
- [ ] `#question` 未手写题号
- [ ] 解答题小题用 `+`
- [ ] 解答题分值用 `points`
- [ ] 长文档分段输出，最后整合
- [ ] 答案区用 `#solution-block`，内含 `= 题型` 标题
- [ ] 答案用 `#answer[...]`，解析用 `#tag[解析]:`，给分用 `#score(...)`
- [ ] 原卷含答案时，正文不掺答案