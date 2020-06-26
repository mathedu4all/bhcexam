# BHCexam

> 一个让Latex初学者快速上手的试卷排版文档类.

## 特别说明

BHCexam 自 0.5 版本起，针对 [橘子数学开源题库社区](https://www.mathcrowd.cn) 的组卷导出功能而定制开发.

## 文档

BHCexam的相关帮助文档:

* [BHCexam文档](http://docs.mathcrowd.cn/advances/bhcexam.html)
* [如何编译橘子数学的 .tex 文件](http://docs.mathcrowd.cn/howtos/how_to_compile_mathcrowd_tex.html)
* [如何将Word/PDF文件中的内容转为$\LaTeX$](http://docs.mathcrowd.cn/howtos/how_to_import_from_word.html)

## 版本历史

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
  * 使用 `stix` 数学字体
  * 支持在选择题最后显示右对齐括号
* **version 1.1** (2020.1)
  * 新增对A3双栏版式的支持
  * 新增列表样式的试题

* **version 1.0** (2019.5)
  * 弃用 `exam` 而改用 `article` 为基宏包类

## Contributors

* Bao Hongchang - @mathedu4all,  charles@mathcrowd.cn
* CamuseCao - @ CamuseCao, camusecao@gmail.com

## 社区其他项目

* [mathcrowd-css](https://github.com/mathedu4all/mathcrowd-css)

  该项目实现了将橘子数学开源题库中的试题一键导出到微信公众号，其中包含了一个测试环境和所有导出样式的CSS.

* [mathcrowd-docs](https://github.com/mathedu4all/mathcrowd-docs)

  橘子数学社区文档.



------

This work may be distributed and/or modified under the conditions of
the LaTeX Project Public License, either version 1.3 of this license
or (at your option) any later version.

