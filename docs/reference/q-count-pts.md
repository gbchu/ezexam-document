设置小节每道题的分数，统计小节题目数量、题目总量、小节分数、试卷总分数的常量；

# `set-per-pts` 方法 <badge type="warning" text="0.4.0" />

该方法为小节设置每道题的分数


### 参数

#### `pts`

`类型: arguments`

`默认值: 无`

>每题的分数

#### 示例
```typst
// 设置小节每题的分数，第 1 小节每题 5 分，第 2 小节每题 6 分，第 3 小节每题 5 分
#set-per-pts(5, 6, 5)

= 单选题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。

= 填空题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。

= 解答题：本题共 #sec-q-cnt 小题，共 #sec-pts 分。
```

# `sec-q-cnt` <badge type="warning" text="0.4.0" />

该常量统计小节的题目数量

`默认值: 0`

# `per-pts` <badge type="warning" text="0.4.0" />

该常量为小节每题的分数

`默认值: none`

# `sec-pts` <badge type="warning" text="0.4.0" />

该常量统计小节的总分数

`默认值: 0`

:::tip
1. 如果题目设置了 [points](/reference/question#points) ，则 `sec-pts` 会优先累加题目设置的分数，而不是 `set-per-pts` 设置的分数。若都没有设置，则 `sec-pts` 使用默认值！
2. 以上  `sec-q-cnt`、`per-pts`、`sec-pts`  3 个常量，若在调用时，前面没有任何小节，则将默认使用后面第一个小节的值。
:::

#### 示例
```typst
= 单选题：本题共 #sec-q-cnt 小题，每小题 #per-pts 分，共 #sec-pts 分。
```

# `tot-pts` <badge type="warning" text="0.4.0" />

该常量统计试卷的总分数

`默认值: 0`

# `tot-q-cnt` <badge type="warning" text="0.4.0" />

该常量统计试卷的总题目数量

`默认值: 0`