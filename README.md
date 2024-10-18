# BHCexam

[中文文档](./README-zh.md)

The `BHCexam.cls` is a LaTeX document class designed for typesetting exams. It is currently used by the [Mathcrowd Problem Database](https://database.mathcrowd.cn) to generate exam PDF files. The class supports the following features:

- Support for configuring whether to display answers.
- Ability to set whether the document is formatted in multiple columns.
- Alignment customization options.
- Automatic alignment of option lengths to a grid.
- Ability to adjust the width of blank lines based on the length of fill-in-the-blank answers.
- Option to display or hide scores for question groups.
- Customizable answer space for each question.
- Ability to restart numbering in question groups.
- Support for sub-questions and nested sub-questions in short-answer questions.

[Official Site (Chinese)](https://lab.mathcrowd.cn/bhcexam)

[Documentation（Chinese）](https://lab.mathcrowd.cn/bhcexam/docs)

[Issues](https://github.com/mathedu4all/bhcexam/issues)


## Version History

* **version 1.8** (October 2024)
    * Added `fontset` and `zihao` options to directly pass to `ctex`.
    * Support for adding scores to `\subquestion`.
    * Reorganized document and package comments.
    * Redefined some commands (`\parallel`, `\Re`, `\Im`) to align with national standards.
* **version 1.7** (August 2022)
    * Adjusted `ctex` font and size settings for TeXLive 2022.
* **version 1.6** (August 2021)
    * Discontinued use of the `stix` math fonts.
    * Set `punct = kaiming` in `ctex`.
* **version 1.5** (June 2020)
    * Added the `r` option to the `questions` environment to reset numbering within question groups.
    * Cleaned up historical versions in the `master` branch.
    * Added the `fandol` package option to support the `fandol` font family.
* **version 1.4** (May 2020)
    * Support for nested `subquestion` environments.
    * Redefined the `\parallel` command.
* **version 1.3** (March 2020)
    * Added `\sixchoices` and `\threechoices` commands to support 3 and 6-option multiple-choice questions with smart line-breaking and option alignment.
* **version 1.2** (March 2020)
    * Support for Apple fonts.
    * Implemented `stix` math fonts.
    * Added support for right-aligned parentheses in multiple-choice questions.
* **version 1.1** (January 2020)
    * Added support for A3 dual-column layout.
    * Introduced list-style question formatting.
* **version 1.0** (May 2019)
    * Switched from using the `exam` class to the `article` class as the base class.

## Contributors

* Bao Hongchang - @mathedu4all, charles@mathcrowd.cn
* CamuseCao - @CamuseCao, camusecao@gmail.com

------

This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this license or (at your option) any later version.
