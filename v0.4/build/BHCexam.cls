%%
%% This is file `BHCexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% BHCexam.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2011 by Charles Bao <charley792@gmail.com>
%% 
%% This file was generated from file(s) of the BHCexam package project.
%% ----------------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
%% This file may only be distributed together with a copy of original
%% source files. You may however distribute original source files
%% without such generated files. Copying of this file is authorized
%% only if either:
%% (1) you make absolutely no changes to your copy, including name; OR
%% (2) if you do make changes, you first rename it to some other name.
%% 
%% To produce the documentation run the original source files ending
%% with `.dtx' through LaTeX.
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{BHCexam}
  [2015/10/10 v0.4 BHCexam
   document class]


\newif\if@sixteenkpaper \@sixteenkpaperfalse
\DeclareOption{16kpaper}{\@sixteenkpapertrue}
\newif\if@marginline \@marginlinefalse
\DeclareOption{marginline}{\@marginlinetrue}
\newif\if@noindent \@noindentfalse
\DeclareOption{noindent}{\@noindenttrue}
\DeclareOption{answers}{\PassOptionsToClass{\CurrentOption}{exam}}

\newif\if@printbox \@printboxfalse
\DeclareOption{printbox}{\@printboxtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions
\LoadClass[addpoints]{exam}
\RequirePackage{ctex}
\RequirePackage{ifpdf,ifxetex}
\RequirePackage{amsmath,amssymb,amsthm,bm,bbding,pifont,dsfont}
\RequirePackage{mathtools}
\RequirePackage{paralist,cases,tabularx}
\RequirePackage{pstricks,pst-plot,xcolor,graphicx}
\if@marginline
\marginparwidth = 2cm
\if@sixteenkpaper
\RequirePackage[papersize={184mm,260mm},hmargin={3cm,2cm},
vmargin={2cm,2cm},marginparsep=0.5cm,hoffset=0cm,voffset=0cm,
footnotesep=0.5cm,headsep=0.5cm,twoside]{geometry}
\else
\RequirePackage[paper=a4paper,hmargin={3cm,2cm},vmargin={2cm,2cm},
marginparsep=0.5cm,hoffset=0cm,voffset=0cm,footnotesep=0.5cm,
headsep=0.5cm,twoside]{geometry}
\fi
\else
\if@sixteenkpaper
\RequirePackage[papersize={184mm,260mm},hmargin={2cm,2cm},
vmargin={2cm,2cm},marginparsep=0.5cm,hoffset=0cm,voffset=0cm,
footnotesep=0.5cm,headsep=0.5cm]{geometry}
\else
\RequirePackage[papersize={210mm,297mm},hmargin={2cm,2cm},vmargin={2cm,2cm},
marginparsep=0.5cm,hoffset=0cm,voffset=0cm,footnotesep=0.5cm,
headsep=0.5cm]{geometry}
\fi
\fi
\renewcommand{\baselinestretch}{1.5}
\pagestyle{headandfoot}
\header{}{}{}
\footer{}{\small \quad 第~\thepage~页(共~\numpages~页)}{}
\pointname{分}
\pointformat{\kaishu (\thepoints)}
\renewcommand{\questionshook}{
  \settowidth{\leftmargin}{22.\hskip\labelsep}
  \if@noindent \setlength\leftmargin{0pt} \fi
}
\renewcommand{\thepartno}{\arabic{partno}}
\renewcommand{\partlabel}{(\thepartno)}
\renewcommand{\partshook}{
  \settowidth{\leftmargin}{(3).\hskip\labelsep}
  \if@noindent \setlength\leftmargin{0pt} \fi
}
\newif\if@cancelspace \@cancelspacetrue
\renewcommand{\solutiontitle}{\noindent 解：\noindent}
\renewenvironment{solution}%
  {%
    \ifprintanswers
      \begingroup
      \Solution@Emphasis
      \begin{TheSolution}%
    \else
      \if@cancelspace
        %\unskip
      \else
        \par
        \penalty 0
        \vfill%
        \if@printbox \if@houpinfen \houpinfen \fi \fi
      \fi
      \setbox\z@\vbox\bgroup
    \fi
  }{%
    \ifprintanswers
      \end{TheSolution}%
      \endgroup
    \else
      \egroup
    \fi
  }%
\if@marginline
\newsavebox{\zdxl}
\sbox{\zdxl}{
\begin{minipage}{0.7\paperheight}
\begin{center}
\heiti 班级\underline{\hspace{15ex}} \quad
姓名 \underline{\hspace{15ex}} \quad
学号 \underline{\hspace{15ex}} \quad \\
\vspace{3ex}
\dotfill 装 \dotfill 订 \dotfill 线 \dotfill
\end{center}
\end{minipage}
}
\newsavebox{\zdxr}
\sbox{\zdxr}{
\begin{minipage}{0.7\paperheight}
\begin{center}
\heiti \hfill 请 \hfill 不 \hfill 要 \hfill 在 \hfill
 装 \hfill 订 \hfill 线 \hfill 内 \hfill 答 \hfill 题 \hfill \\
\vspace{3ex}
\dotfill 装 \dotfill 订 \dotfill 线 \dotfill
\end{center}
\end{minipage}
}
\newcommand{\printmlol}{
\marginpar{\rotatebox{90}{\usebox{\zdxl}}}
}
\newcommand{\printmlor}{
\marginpar{\rotatebox{-90}{\usebox{\zdxr}}}
}
\reversemarginpar
\fi
\newcommand\biaoti[1]{\def\@biaoti{#1}}
\newcommand\fubiaoti[1]{\def\@fubiaoti{#1}}
\renewcommand\maketitle{
  \begin{center}{\heiti \Large{\@biaoti}}\end{center}
  \begin{center}{\heiti \Large{\@fubiaoti}}\end{center}
}
\newcommand\xinxi[2]{
  \def\@zongfen{#1}
  \def\@shijian{#2}
}
\newcommand\mininotice{
  \begin{center}{
    \kaishu (本试卷满分~\@zongfen~分, 考试时间~\@shijian~分钟)}
  \end{center}
}
\newcommand{\notice}{
  \heiti 注意事项： \songti
  \begin{enumerate}
  \item 答卷前, 考生务必将姓名、高考准考证号、校验码等填写清楚.
  \item 本试卷共~\numquestions{}~道试题, 满分~\@zongfen~分,考试时间~\@shijian~分钟.
  \end{enumerate}
}
\newlength\@boxwidth
\setlength\@boxwidth{0ex}
\if@printbox \setlength\@boxwidth{18ex} \fi
\newcommand\pinfen{
  \heiti
  \begin{minipage}{\@boxwidth}
  \begin{tabular}{|c|c|}
  \hline
  得分 & 评卷人\\
  \hline
      &       \\
  \hline
  \end{tabular}
  \end{minipage}
}
\newcommand{\houpinfen}{
  \hfill
  \begin{tabular}{|l|l|}
    \hline
    得分 & \hspace*{1.5cm}\\
    \hline
  \end{tabular}
  \bigskip
}
\newcounter{@dati}
\newif\if@houpinfen \@houpinfenfalse
\newcommand\settk[3]{
  \def\@tiankong@zongfen{#1}
  \def\@tiankong@tishu{#2}
  \def\@tiankong@fen{#3}
}
\newcommand\tiankong{
  \@houpinfenfalse
  \stepcounter{@dati}
  \fullwidth{
    \if@printbox \pinfen \fi
    \begin{minipage}{\textwidth-\@boxwidth}
    \heiti \chinese{@dati}. 填空题：本大题共~\@tiankong@tishu~题，满分~\@tiankong@zongfen~分. 请在横线上方填写最终的、最准确的、最完整的结果. 每题填写正确得~\@tiankong@fen~分，否则一律得0分.
    \end{minipage}
  }
}
\newcommand{\stk}[1]{
  \ifprintanswers
    \underline{~#1~}
  \else
    \underline{~\hspace{1cm}~}
  \fi}
\newcommand{\mtk}[1]{
  \ifprintanswers
    \underline{~#1~}
  \else
    \underline{~\hspace{2cm}~}
  \fi}
\newcommand{\ltk}[1]{
  \ifprintanswers
    \underline{~#1~}
  \else
    \underline{~\hspace{3cm}~}
  \fi}
\newcommand\setxz[3]{
  \def\@xuanze@zongfen{#1}
  \def\@xuanze@tishu{#2}
  \def\@xuanze@fen{#3}
}
\newcommand\xuanze{
  \@houpinfenfalse
  \stepcounter{@dati}
  \fullwidth{
    \if@printbox \pinfen \fi
    \begin{minipage}{\textwidth-\@boxwidth}
      \heiti \chinese{@dati}. 选择题：本大题共~\@xuanze@tishu~题，满分~\@xuanze@zongfen~分. 请选择你认为最正确的答案（每小题有且只有一个）写在括号内. 每题填写正确得~\@xuanze@fen~分，否则得0分.
    \end{minipage}
  }
}
\newcommand{\onech}[4]{
\renewcommand\arraystretch{1.4}
\begin{tabularx}{\linewidth}{XXXX}
\setlength\tabcolsep{0pt}
(A) #1 & (B) #2 & (C) #3 & (D) #4 \\
\end{tabularx}
\unskip \unskip}
\newcommand{\twoch}[4]{
\renewcommand\arraystretch{1.4}
\begin{tabularx}{\linewidth}{XX}
\setlength\tabcolsep{0pt}
(A) #1 & (B) #2 \\
(C) #3 & (D) #4
\end{tabularx}
\unskip \unskip}
\newcommand{\fourch}[4]{
\renewcommand\arraystretch{1.4}
\begin{tabularx}{\linewidth}{X}
\setlength\tabcolsep{0pt}
(A) #1 \\
(B) #2 \\
(C) #3 \\
(D) #4 \\
\end{tabularx}
\unskip \unskip}
\newcommand\setjd[2]{
  \def\@jianda@zongfen{#1}
  \def\@jianda@tishu{#2}
}
\newcommand\jianda{
  \@cancelspacefalse
  \@houpinfentrue
  \stepcounter{@dati}
  \fullwidth{
    \if@printbox \pinfen \fi
    \begin{minipage}{\textwidth-\@boxwidth}
      \heiti \chinese{@dati}. 简答题：本大题共~\@jianda@tishu~题，满分~\@jianda@zongfen~分. 请在题后空处写出必要的推理计算过程.
    \end{minipage}
  }
}
\delimitershortfall-1sp
\newcommand\abs[1]{\left|#1\right|}
\renewcommand{\geq}{\geqslant}
\renewcommand{\ge}{\geqslant}
\renewcommand{\leq}{\leqslant}
\renewcommand{\le}{\leqslant}
\AtEndOfPackage{\makeatletter\input{BHCexam.cfg}\makeatother}

\endinput
%%
%% End of file `BHCexam.cls'.
