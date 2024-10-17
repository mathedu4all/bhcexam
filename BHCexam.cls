% BHCexam.cls
% Version: 1.8
% Date: 2024/10/15
% Author: BAO HONG CHANG
% Description: An exam class orignally designed for mathematics teachers in China.
%              Used by Mathcrowd.cn since 2016 as the default class to export exam papers from database.
% License: LaTeX Project Public License (LPPL), version 1.3 or later.
% Documentation: https://lab.mathcrowd.cn/bhcexam/docs
% Support: https://github.com/mathedu4all/bhcexam/issues


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BHCexam}[2024/10/15 Version 1.8 by BAO HONG CHANG]

 
% Options
\newif\if@printanswers \@printanswersfalse
\DeclareOption{answers}{\@printanswerstrue}

\newif\if@twocolumn  \@twocolumnfalse
\DeclareOption{twocolumn}{\@twocolumntrue}

\newif\if@list  \@listfalse
\DeclareOption{list}{\@listtrue}

% Fontset, zihao, linestretch options
\def\@fontset{none}
\def\@zihao{5}
\def\@linestretch{4}
\newif\if@fontsetspecified \@fontsetspecifiedfalse
\DeclareOption{fontset}{\renewcommand{\@fontset}{#1}\@fontsetspecifiedtrue}
\DeclareOption{zihao}{\renewcommand{\@zihao}{#1}}
\DeclareOption{linestretch}{\renewcommand{\@linestretch}{#1}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load required packages
\LoadClass{article}

% Conditional loading of ctex with fontset option
\if@fontsetspecified
    \RequirePackage[fontset = \@fontset, punct=kaiming, zihao = \@zihao]{ctex}
\else
    \RequirePackage[punct=kaiming, zihao = \@zihao]{ctex}
\fi

\ctexset{linestretch = \@linestretch, autoindent = 0pt}
\RequirePackage{tabularx, ifthen, xcolor, graphicx, caption}
\RequirePackage{geometry, fancyhdr, etoolbox, amsmath, amssymb, unicode-math, pifont, bbding, romannum, enumitem}

% Page setup
\AtBeginDocument{
    \pagenumbering{arabic}
}

% Two-column layout
\if@twocolumn
    \geometry{a3paper,landscape, twocolumn,columnsep=40mm,left=50mm,right=30mm,top=35mm,bottom=25mm,headheight=20mm}
\else
    \geometry{a4paper,left=30mm,right=30mm,top=35mm,bottom=25mm, headheight=20mm}
\fi

% Figure caption setup
\captionsetup[figure]{font=small,belowskip=0pt}


% Title page setup
\gdef\@subtitle{}
\gdef\@notice{}
\gdef\@author{}
\gdef\@date{}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\title}[1]{\gdef\@title{#1}}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\notice}[1]{\def\@notice{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\renewcommand{\date}[1]{\gdef\@date{#1}}

\renewcommand\maketitle{\begingroup
	\renewcommand{\baselinestretch}{2}
	\newpage
	\begin{center}
		\heiti \Large
		\@title \par
		\ifdefempty{\@subtitle}{}{
			\@subtitle \par
		}
	
		\ifdefempty{\@author}{}{
			\songti \normalsize
			\@author \par
		}
	
		\ifdefempty{\@notice}{}{
			\setlength{\fboxsep}{1em}
			\vspace{0.5\baselineskip}
			\fbox{
				\parbox{0.5\linewidth}{
					\kaishu \normalsize 
					\@notice \par
				}
			}
			\vspace{0.5\baselineskip}
		}
	

	\end{center}
	\renewcommand{\baselinestretch}{1}
	\ifdefempty{\@date}{}{
		\begin{flushright}
			\songti \small
			\@date \par
		\end{flushright}
	}
	\songti \normalsize
\endgroup}

% Set default array and baseline stretch
\renewcommand\arraystretch{1.5}
\renewcommand{\baselinestretch}{1.5}

% Define counters and flags
\newcounter{Group}
\newcounter{Question}
\newcounter{Example}
\newcounter{Exercise}
\newcounter{Method}[Question]

\newif\if@showscore \@showscorefalse
\newif\if@showskip \@showskipfalse
\newif\if@showparen \@showparenfalse
\newif\if@resetcounter \@resetcounterfalse
\newlength{\myvertspace}

% Custom math commands
\newcommand\abs[1]{\left|#1\right|}
\newcommand{\gt}{>}
\newcommand{\lt}{<}
\renewcommand{\geq}{\geqslant}
\renewcommand{\ge}{\geqslant}
\renewcommand{\leq}{\leqslant}
\renewcommand{\le}{\leqslant}
\renewenvironment{split}{\begin{aligned}}{\end{aligned}}
\renewcommand\parallel{\mathrel{/\mskip-2.5mu/}}
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}

% Define environments (groups, questions, solution)
\newenvironment{groups}{
	\if@list
		\list{\heiti\chinese{Group}.}{\usecounter{Group}}
	\else
		\par \begingroup \par
	\fi
}{
	\if@list
		\endlist
	\else
		\par \endgroup \par
	\fi
}

% Define commands (group, question, example, exercise, subquestion)
\newcommand{\group}[2]{
	\if@list
		\item \heiti{#1} \quad \kaishu \small #2 \songti \normalsize \par
	\else
		\stepcounter{Group}
		\par \heiti{\par \chinese{Group} 、#1} \quad \small{\kaishu #2} \songti \normalsize \par
	\fi

}

\newenvironment{questions}[1][]{
	\@tfor \@opt :=#1\do
		{\if\@opt s\global\@showscoretrue\fi
		 \if\@opt t\global\@showskiptrue\fi
	 	 \if\@opt p\global\@showparentrue\fi
 	 	 \if\@opt r\global\@resetcountertrue\fi}
  	\if@resetcounter
  		\setcounter{Question}{0}
	 \fi
	\if@list
		\list{\arabic{Question}.}{\setlength{\leftmargin}{0pt}}
	\else
		\par \begingroup \par
	\fi
}{
	\if@list
		\endlist
	\else
		\par \endgroup \par
	\fi
	
	\global\@showscorefalse
	\global\@showskipfalse
	\global\@showparenfalse
}

\newcommand{\question}[1][0]{
	\stepcounter{Question}
	\if@list
		\item \if@showscore \kaishu ( #1 分) \songti \fi
	\else
		\vspace{2mm}

		\arabic{Question}. 
		\if@showscore \kaishu ( #1 分) \songti \fi
	\fi
}

\newcommand{\example}[1][0]{
	\stepcounter{Example}
	\if@list
		\item[例题\arabic{Example}. ]
		\if@showscore \kaishu ( #1 分) \songti \fi
	\else
		\vspace{2mm}
		\par 例题\arabic{Example}. 
		\if@showscore \kaishu ( #1 分) \songti \fi
	\fi
}

\newcommand{\exercise}[1][0]{
	\stepcounter{Exercise}
	\if@list
		\item[习题\arabic{Exercise}. ]
		\if@showscore \kaishu ( #1 分) \songti \fi
	\else
		\vspace{2mm}
		\par 习题\arabic{Exercise}. 
		\if@showscore \kaishu ( #1 分) \songti \fi
	\fi
}

\newlist{subquestions}{enumerate}{2}
\setlist[subquestions,1]{label=(\arabic*)}
\setlist[subquestions,2]{label=(\roman*)}
\newcommand{\subquestion}[1][0]{
    \item \if@showscore \kaishu ( #1 分) \songti \fi
}


% Define hint, method, and methodonly commands

\newenvironment{solution}[1]{
	\setlength{\myvertspace}{#1}
	\par \if@printanswers \par \color{red} \begingroup \else \if@showskip \vspace*{\myvertspace} \fi \setbox\z@\vbox\bgroup\fi \songti
}{
	\par \if@printanswers \endgroup \color{black} \else \egroup \fi \par
}

\newcommand{\hint}{
	\par \fbox{\heiti{提示}} \par \songti
}
\newcommand{\method}{
	\stepcounter{Method}
	\vspace{2mm}
	\par \fbox{\heiti{解法\chinese{Method}}} \par \songti
}
	
\newcommand{\methodonly}{
	\par \fbox{\heiti{解答}} \par \songti
}

\newcommand{\score}[2]{
	\par
	\dotfill 本步骤 #1 分， 累计 #2 分
	\par}

% Define multiple-choice commands

\makeatletter
\newcommand{\build}[2]{\leavevmode
	\count@=\z@ \toks@={}%
	\loop\ifnum\count@<\numexpr#1\relax
	\toks@=\expandafter{\the\toks@#2}%
	\advance\count@\@ne
	\repeat
	\the\toks@}
\makeatletter
\newlength{\keylength}
\newcommand{\key}[1]{
	\if@printanswers
	\underline{~~#1~~}
	\else
	\settowidth{\keylength}{~~#1~~}
	\build{13}{\hskip1sp\kern-1sp\hbox to 0.1\keylength{\hrulefill}}
	\fi}

\newlength{\choicelengtha}
\newlength{\choicelengthb}
\newlength{\choicelengthc}
\newlength{\choicelengthd}
\newlength{\choicelengthe}
\newlength{\maxlength}

\newcommand{\threechoices}[3]{
	\if@showparen \dotfill (\qquad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}

	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & \\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ &\\ 
			\end{tabularx}
		}
	}
	\unskip \unskip 
}

\newcommand{\fourchoices}[4]{
	\if@showparen \dotfill (\qquad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~\\ 
			\end{tabularx}
		}%
	}
	\unskip \unskip 
}

\newcommand{\fivechoices}[5]{
	\if@showparen \hfill \dotfill (\quad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\settowidth{\choicelengthe}{E.~#5~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\choicelengthe>\maxlength}}{\setlength{\maxlength}{\choicelengthe}}{}
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
			E.~#5~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
				E.~#5~~~ &         \\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~ \\
				E.~#5~~~  &          &          &          \\
			\end{tabularx}
		}
	}%
	\unskip \unskip 
}

\newcommand{\sixchoices}[6]{
	\if@showparen \hfill \dotfill (\quad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\settowidth{\choicelengthe}{D.~#5~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}	\ifthenelse{\lengthtest{\choicelengthe>\maxlength}}{\setlength{\maxlength}{\choicelengthe}}{}
	
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
			E.~#5~~~\\
			F.~#6~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
				E.~#5~~~ & F.~#6~~~\\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~ \\
				E.~#2~~~  & F.~#6~~~ &          &          \\
			\end{tabularx}
		}%
	}
	\unskip \unskip 
}


\endinput