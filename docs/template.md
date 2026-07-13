# 模板示例

## 试卷模版
```typst
#import "@preview/ezexam:0.3.2": *

#show: setup.with(
  mode: EXAM,
  paper: a3,
  show-answer: true,
  show-gap-line: true,
)

#outline()
#chapter[2025新高考I卷]
#title[2025年普通高等学校招生全国统一考试]
#subject[数学]
#secret()
#score-box(y: .35in)
#exam-type[A]
#exam-info(
  info: (命题人: "张三  李四  王五", 审题: "老六", 时间: "120分钟", 满分: tot-pts),
  columns: 2,
)
#notice(
  [答题前，考生务必将自已的姓名、考生号、考场号、座位号填写在答题卡上。],
  [回答选择题时，选择每小题答案后，用铅笔把答题卡上对应题目的答案标号涂黑，如需改动，用橡皮擦干净后，再选涂其他答案标号。回答非选择题时，将答案写在答题卡上，写在本试卷上无效。
  ],
  [考试结束后，请将本试卷和答题卡一并交回。],
)

#set-per-pts(5, 6, 5) // 设置小节每题的分数

= 单选题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。在每小题给出的四个选项中，只有一项是符合题目要求的。

#question[
  $(1 + 5"i")"i"$ 的虚部为 #paren[C]
  #choices(-1, 0, 1, 6)
]

#question[
  集合 $U = {x | x$为小于9的正整数}, $A = {1,3,5}$, 则 $complement_U A$ 中的元素个数为 #paren[C]
  #choices(0, 3, 5, 8)
]

#question[
  若双曲线 $C$ 的虚轴长为实轴长的 $sqrt(7)$ 倍，则 $C$ 的离心率为 #paren[D]
  #choices([$sqrt(2)$], 2, [$sqrt(7)$], [$2sqrt(2)$])
]

#question[
  若点 $(a,0) (a > 0)$ 是函数 $y = 2tan(x - pi / 3)$ 的图象的一个对称中心，则 $a$ 的最小值为 #paren[B]
  #choices([30°], [60°], [90°], [135°])
]

#question[
  设 $f(x)$ 是定义在 R 上且周期为 2 的偶函数，当 $2 lt.slant x lt.slant 3$ 时，$f(x) = 5 - 2x$，则 $f(-3 / 4 ) =$
  #paren[A]
  #choices([$-1 / 2$], [$-1 / 4$], [$1 / 4$], [$1 / 2$])
]

#question[
  已知视风速是真风速和船风速的和向量，船风速与船行驶速度大小相等，方向相反.则真风速等级是 #paren[A]
  #text-figure(
    figure: image("6.png", height: 1.5in), // 替换为你自己的图片路径
    figure-x: -1in,
    figure-y: 10pt,
  )[#choices(
    columns: 1,
    [轻风 (1.6$~$3.3 m/s)],
    [微风 (3.4$~$5.4 m/s)],
    [和风 (5.5$~$7.8 m/s)],
    [劲风 (8.0$~$10.7 m/s)],
  )]
]

#question[
  若圆 $x^2 + (y + 2)^2 = r^2 (r > 0)$ 上到直线 $y = sqrt(3)x + 2$ 的距离为 1 的点有且仅有 2 个，则 $r$ 的取值范围是
  #paren[B]
  #choices([(0, 1)], [(1, 3)], [(3, +∞)], [(0, +∞)])
]

#question[
  若实数 $x, y, z$ 满足 $2 + log_2 x = 3 + log_3y = 5 + log_5 z$，则 $x, y, z$ 的大小关系不可能是 #paren[B]
  #choices([$x > y > z$], [$x > z > y$], [$y > x > z$], [$y > z > x$])
]

= 多选题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 #per-pts 分，部分选对的得部分分，有选错的得 0 分。
#question[
  在正三棱柱 $A B C-A_1B_1C_1$ 中，$D$ 为 $B C$ 中点，则 #paren[BD]
  #choices([$A D perp A_1C$], [$B C perp "平面" A A_1D$], [$C C_1 parallel "平面" A A_1D$], [$A D parallel A_1B_1$])
]

#question[
  设抛物线 $C: y^2 = 6x$ 的焦点为 $F$，过 $F$的直线交 $C$ 于$A、B$，过 $F$ 且垂直于 $A B$的直线交准线 $l$: $y = -3 / 2x$
  于 $E$，过点$A$作准线的垂线，垂足为$D$，则 #paren[ACD]
  #choices([$|A D| = |A F|$], [$|A E| = |A B|$], [$|A B| gt.slant 6$], [$|A E| dot |B E| gt.slant 18$])
]

#question[
  已知 $triangle A B C$ 的面积为 $1 / 4$，若 $cos 2A + cos 2B + cos 2C = 2,cos A cos B sin C = 1 / 4$，则 #paren[ACD]
  #choices([$sin C = sin^2 A + sin^2 B$], [$A B = sqrt(2)$], [$sin A + sin B = sqrt(6) / 2$], [$A C^2 + B C^2 = 3$])
]

= 填空题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。
#question[
  若直线 $y = 2x +5$ 是曲线 $y = e^x + x + a$ 的切线，则 $a$ = #fillin[4].
]

#question[
  若一个正项等比数列的前 4 项和为 4，前 8 项和为 68，则该等比数列的公比为 #fillin[2].
]

#question[
  一个箱子里有 5 个球，分别以 1$~$5 标号，若有放回取三次，记至少取出一次的球的个数 $X$，则 $E(X)$ = #fillin[$61/25$].
]

= 解答题：本题共 #sec-q-cnt 小题，共 #sec-pts 分。解答应写出文字说明、证明过程或演算步骤。
#question(points: 13, bottom: 1in)[
  为研究某疾病与超声波检查结果的关系，从做过超声波检查的人群中随机调查了1000人，得到如下的列联表：
  #align(center)[
    #table(
      columns: 4,
      [], [正常], [不正常], [合计],
      [患该疾病], [20], [180], [200],
      [未患该疾病], [780], [20], [800],
      [合计], [800], [200], [1000],
    )
  ]
  + 记超声波检查结果不正常者患有该疾病的概率为$p$，求$p$的估计值；
  + 根据小概率值$alpha=0.001$的独立性检验，分析超声波检查结果是否与患该疾病有关.
  #text-figure(
    top: 10pt,
    figure: table(
      columns: 4,
      [$P(chi^2 gt.slant k)$], [0.005], [0.010], [0.001],
      [$k$], [3.841], [6.635], [10.828],
    ),
  )[附：$chi^2 = n(a d - b c)^2 / ((a + b)(c + d)(a + c)(b + d))$]
]

#question(points: 15, bottom: 1in)[
  设数列 ${a_n}$ 满足 $a_1 = 3"， "a_(n+1) / n = a_n / (n+1) + 1 / (n(n+1))$.
  + 证明：${n a_n}$ 为等差数列；
  + 设 $f(x) = a_1x + a_2x^2 + dots.c + a_m x^m，求 f'(-2)$.
]

#question(points: 15, bottom: 1in)[
  如图所示的四棱锥 $P - A B C D$ 中，$P A perp "平面" A B C D, B C parallel A D, A B perp A D$.
  + 证明：平面 $P A B perp "平面" P A D$
  + 若 $P A = A B = sqrt(2), A D = sqrt(3) + 1, B C = 2$，$P, B, C, D$ 在同一个球面上，设该球面的球心为 $O$.
    #text-figure(
      figure: image("17.png", height: 1.6in), // 替换为你自己的图片路径
    )[
      + 证明：$O$ 在平面 $A B C D$上；
      + 求直线 $A C$ 与直线 $P O$ 所成角的余弦值.
    ]
]

#question(points: 17, bottom: 1in)[
  设椭圆 $C: x^2 / a^2 + y^2 / b^2 = 1 (a > b > 0)$，记 $A$为椭圆下端点，$B$ 为右端点，$|A B|= sqrt(10)$，且椭圆 $C$
  的离心率为 $(2sqrt(2)) / 3$.
  + 求椭圆的标准方程；
  + 设点 $P(m, n)$.
    + 若 $P$ 不在 $y$ 轴上，设 $R$ 是射线 $A P$ 上一点，$|A R| dot |A P| = 3$，用 $m, n$ 表示点 $R$ 的坐标；
    + 设直线$O Q$ 的斜率为 $k_1$，直线 $O P$ 的斜率为 $k_2$，若 $k_1 = 3k_2$，$M$为椭圆上一点，求 $|P M|$ 的最大值.
]

#question(points: 17)[
  设函数 $f(x) = 5cos x - cos 5x$.
  + 求 $f(x)$ 在 $[0, pi / 4]$ 的最大值；
  + 给定 $theta in (0,pi)，a$ 为实数，证明：存在 $y in [a - theta, a + theta]$，使得 $cos y lt.slant cos theta$；
  + 若存在 $phi$，使得对任意 $x$，都有 $5cos x - cos(5x + phi) lt.slant b$，求 $b$ 的最小值.
]

#page-restart()

#solution-block[
  #let answer = tag.with(prefix: "答案：", suffix: none, color: maroon)
  #solution(title: "解析")[
    #answer[A]

    解: #lorem(6)#score(6)
  ]

  #solution[
    #answer[B]

    解: #lorem(8)#score(8)
  ]
]

```

## 试卷模版效果

![效果图](/template.png)

## 讲义模版

```typst
#import "/package.typ": *

#show: setup.with(
  show-answer: true,
  heading-color: fuchsia,
  enum-spacing: 2.5em,
)
#let solution = solution.with(
  title: "解析",
  top: 10pt,
  show-number: false,
)
#let answer = tag.with(color: maroon)
#let marker = tag.with(color: green, weight: 700)
#let star(num) = tag(prefix: none, suffix: none, "★") * num

#outline()
#title[高等数学]
= 极限
== 两个重要的极限 #star(3)
+ $lim_(x arrow 0) (sin x) / x = 1$
+ $lim_(x arrow infinity) (1+1/x)^x = e$

== 最高次幂法(取高阶)
$
  lim_(x arrow infinity) frac(a_0x^m + a_1x^(m-1)+dots.c+a_m, b_0x^n + b_1x^(n-1)+dots.c+b_m)= cases(0 & space.quad m<n, display(a_0/b_0) & space.quad m=n, infinity & space.quad m>n)
$


#question[$lim_(n -> infinity) frac(1 + 2 + 3 + dots.c + n-1, n^2)=1/2$]

== 等价无穷小
+ $x~sin x~tan x~arcsin x ~arctan x ~log (1+x) ~e^x - 1$

+ $1~cos x~x^2/2$

+ $a^x-1~x ln a$

+ $(1+x)^a-1~a x$

#text(maroon)[注: 以上只在$x arrow 0$时成立]

== 洛必达法则

#marker[条件: 未定式]未定式指的是无法确定计算的值: 例如 $0/0 、 infinity/infinity$等.

$ lim frac(f(x), g(x))=lim frac(f'(x), g'(x))=lim frac(f''(x), g''(x))=dots.c $

#question[
  $lim_(x arrow 0)[1/x - frac(ln (x+1), x^2)]=1/2$
]

== 左右极限
左极限：$lim_(x arrow x_0^-) f(x)$ ~~~~~~~~ 右极限：$lim_(x arrow x_0^+) f(x)$

极限存在的条件: $lim_(x arrow x_0^-) f(x)=lim_(x arrow x_0^+) f(x)$;

#question(top: 10pt)[
  $f(x)= cases(x-1 & space.quad x<0, 0 & space.quad x=0, x+1 & space.quad x>0)$，判断$lim_(x arrow 0) f(x)$极限是否存在？若存在求出极限。
]
#solution(inset: (top: 30pt))[
  #answer[不存在]

  解: $lim_(x arrow 0) f(x)= cases(display(lim_(x arrow 0^-)(x-1))=-1, display(lim_(x arrow 0^+))(x+1)=1)$ ~~~~~~
  $because lim_(x arrow 0^-) f(x)!=lim_(x arrow 0^+) f(x)$
  $therefore$ 不存在
]

== 函数连续
#marker[充要条件]
#[#set enum(indent: 2em)
  + 在该点有意义
  + 左极限=右极限=该点函数值;
  + 左极限=该点函数值⟺左连续 ~~~~~~右极限=该点函数值⟺右连续
]

函数在某个点$x_0$处连续，$lim_(x arrow x_0^+) f(x)=lim_(x arrow x_0^-) f(x)=f(x_0)$

#question(top: 10pt)[
  $f(x)=cases(e^(1/x) & space.quad x<0, 0 & space.quad x=0, x sin x & space.quad x>0)$，判断$f(x)$在$x=0$处是否连续？
]
#solution[
  #answer[连续]

  解: $because f(0)=0$

  $lim_(x arrow 0) f(x)=cases(display(lim_(x arrow 0^+)) (x sin x)=0, display(lim_(x arrow 0^-)) e^(1/x)=0)$

  $display(lim_(x arrow 0^+)) (x sin x) = display(lim_(x arrow 0^-)) e^(1/x)=f(0)=0$
  $therefore$ $f(x)$在$x=0$处连续
]

== 函数可导
#marker[充要条件]
#[
  #set enum(indent: 2em)
  + 左右导数都存在
  + 左导数=右导数
]

#text(maroon)[注：可导一定连续，连续不一定可导]

#question[
  函数$f(x)=|x|+1$在$x=0$处#paren[D]
  #choices([无定义], [连续], [可导], [连续但不可导])
]
#solution[
  解：连续性：$because f(0) = lim_(x arrow 0^+) (|x|+1)=lim_(x arrow 0^-) (|x|+1)=1$

  即：左极限等于右极限等于在$x=0$处函数值

  $therefore$函数在$x=0$处连续。

  可导性：$because f'(0)=lim_(Delta x arrow 0) frac(f(0+Delta x)-f(0), Delta x) = cases(display(lim_(Delta x arrow 0^+)) frac(Delta x + 1-1, Delta x)=1, display(lim_(Delta x arrow 0^-)) frac(1-Delta x+1, Delta x)=-1)$
  #v(10pt)
  左导数不等于右导数； $therefore$函数在$x=0$处不可导。
]

== 间断点
=== 定义
在非连续函数$f(x)$中某点$x_0$处有中断现象，那么，$x_0$就称为函数的不连续点。
=== 第一类间断点（极限存在）
+ 可去间断点（左右极限相等）
+ 跳跃间断点（左右极限不相等）

例：$x=0$是函数$f(x)=(sin x)/x$ 的可去间断点；是函数$f(x)=(|x|)/x$ 的跳跃间断点
```

## 讲义模版效果

![效果图](/template2.png)