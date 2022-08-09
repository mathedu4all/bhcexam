# BHCexam

[English](./README.md)

BHCexam 是一款为中国数学老师设计的试卷排版文档类，目前已被 [橘子数学开源题库社区](https://www.mathcrowd.cn) 选用为默认文档类导出试卷pdf文件.

你可以使用该文档类实现：

* 将内容与样式分离
* 使用一个参数生成教师版和学生版试卷;
* 排版3-6个选项的选择题，可根据选项的长度自适应对齐;
* 排版填空题，可根据答案的长度自适应设置横线长度;
* 排版简答题，并以列表形式展示小问，并控制是否展示小问、缩进;
* 对试题分组，对组内试题以列表呈现，并控制是否展示分值、留空、是否重新开始编号;
* 更多 (见 [BHCexam 文档](http://docs.mathcrowd.cn/advances/bhcexam.html) )

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
