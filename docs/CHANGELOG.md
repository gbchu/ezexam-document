# CHANGELOG

## 0 . 1 . 0

+ 初版发布

## 0 . 1 . 1

+ 修复 `choices` 方法中，若选项为图片时，设置宽度为百分比时，图片宽度无效的问题

## 0 . 1 . 2

+ 添加在线使用帮助文档

+ 将 `secret` 修改为方法，可以自定义显示内容

+ 优化 `choices` 方法，当选项过长时，选项从第二行开始进行缩进。修复选项中既有文字又有图标时，标签和内容对不齐的问题

+ 将 `question` 方法的参数 `points-separate-par` 修改为 `points-separate`、修改参数 `with-heading-label` 的默认值为 `false`

+ `explain` 方法添加参数 `show-number` 、修改 `title` 的默认值，默认不显示