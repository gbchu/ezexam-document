# Changelog

## 0 . 1 . 0

+ 初版发布

## 0 . 1 . 1

+ 修复 `choices` 方法中，若选项为图片时，设置宽度为百分比时，图片宽度无效的问题

## 0 . 1 . 2

+ 添加在线使用帮助文档

+ 将 `secret` 修改为方法，可以自定义显示内容

+ 优化 `choices` 方法，当选项过长时，选项从第二行开始进行缩进。修复选项中既有文字又有图表时，标签和内容对不齐的问题

+ 将 `question` 方法的参数 `with-heading-label` 的默认值修改为 `false`

+ `explain` 方法添加参数 `show-number` 、修改参数 `title` 的默认值为 `none`，默认不显示

+ `setup` 方法新增参数 `enum-numbering`

## 0 . 1 . 3

+ 优化 `choices` 方法

+ 将 `question` 方法的参数名 `points-separate-par` 修改为 `points-separate`

+ 增加英文完型填空、7选5题型的支持，让 `paren` 和 `fillin` 方法可以使用题号作为占位符。使用详情查看 [`paren`](https://ezexam.pages.dev/paren) 和 [`fillin`](https://ezexam.pages.dev/fillin) 方法

+ `setup` 方法新增参数 `heading-numbering`，`heading-hanging-indent`，`enum-spacing`，`enum-indent` 提供更多自定义设置

+ 修复 `question` 个数超过9个时,内容对不齐的问题

## 0 . 1 . 4

+ 将 `LECTURE` 修改为 `HANDOUTS`，更加符合语义

+ 将 `explain` 方法名修改为 `solution`，更加符合语义

+ 修复当修改弥封线类型时,试卷最后一页没有更改的 `bug`

+ 添加水印功能，`setup` 方法新增参数 `watermark`，`watermark-size`，`watermark-color`，`watermark-font`，`watermark-rotate`


