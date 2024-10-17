# BHCexam

[English](./README.md)

BHCexam.cls 提供了一个用于排版试卷LaTeX文档类.
[橘子数学题库](https://database.mathcrowd.cn) 正在使用此文档来导出试卷PDF文件. 该文档类可以实现：

- 支持设置是否显示解答

- 支持设置是否是否分栏

- 支持设置对齐方式

- 支持选项长度自动对齐到网格

- 支持根据填空题答案长度预留横线宽度

- 支持设置踢题组是否显示分值

- 支持设置预留答题空间

- 支持设置题组是否重新开始编号

- 支持简答题中的小问及小问的小问

## 版本历史

* **version 1.7** (2022.8)
  * 针对TeXLive 2022, 修正`ctex`的字号、字体设置. 
* **version 1.6** (2021.8)
  * 不再使用`stix`数学字体
  * `ctex` 设置 `punct = kaiming`
* **version 1.5** (2020.6)
  * `questions` 环境新增 `r` 选项，重置题组的编号;
  * 在 `master` 分支中清理历史版本;
  * 新增 `fandol` 宏包选项以支持 `fandol` 字体;
* **version 1.4** (2020.5)
  * 支持`subquestion`环境的嵌套;
  * `\parallel` 命令重定义;
* **version 1.3** (2020.3)
  * 新增 `\sixchoices` , `\threechoices` 命令，以支持对3个和6个选项，并保持智能断行同及选项对齐.
* **version 1.2** (2020.3)
  *  支持苹果字体
  *  使用 `stix` 数学字体
  *  支持在选择题最后显示右对齐括号
* **version 1.1** (2020.1)
  * 新增对A3双栏版式的支持
  * 新增列表样式的试题
* **version 1.0** (2019.5)
  * 弃用 `exam` 而改用 `article` 为基宏包类

## 贡献者

* Bao Hongchang - @mathedu4all,  charles@mathcrowd.cn
* CamuseCao - @ CamuseCao, camusecao@gmail.com

------

This work may be distributed and/or modified under the conditions of
the LaTeX Project Public License, either version 1.3 of this license
or (at your option) any later version.
