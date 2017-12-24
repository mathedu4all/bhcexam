% BHCexam.cls
%
% A LaTeX2e document class for preparing exams.

%% BHCexam.cls
%% Copyright (c) 2011-2017 BAO HONG CHANG
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
% 
% This work consists of the files BHCexam.cls and BHCexamdoc.tex.
%
% The user's guide for exam.cls is in the file examdoc.tex.

%%% BAO HONG CHANG
%%% Math Crowd Inc.
%%% Shanghai
%%% charles@mathcrowd.cn

% The newest version of this documentclass should always be available
% from my web page: https://github.com/mathedu4all/bhcexam

\def\fileversion{1.02}
\def\filedate{2017/11/18}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BHCexam}[\filedate\space Version \fileversion\space by
 BAO HONG CHANG]
 
 %                         *****************
 %                         **    OPIONS   **
 %                         *****************
 
 
 % Following options are available:
 
 % answers
 % printmargin
 % csize5
 % csize4
 % adobe
 % fandol
 % ubuntu
 % windows
 % twocolumn
 % twoside



\newif\if@printanswers
\@printanswersfalse
\DeclareOption{answers}{\@printanswerstrue}

\newif\if@printmargin
\@printmarginfalse
\DeclareOption{printmargin}{\@printmargintrue}

\newcommand\@fontsize{false}
\DeclareOption{csize5}{\renewcommand\@fontsize{5}}
\DeclareOption{csize4}{\renewcommand\@fontsize{-4}}


\newcommand\@fontset{none}
\DeclareOption{adobe}{\renewcommand\@fontset{adobe}}
\DeclareOption{fandol}{\renewcommand\@fontset{fandol}}
\DeclareOption{ubuntu}{\renewcommand\@fontset{ubuntu}}
\DeclareOption{windows}{\renewcommand\@fontset{windowsnew}}

\newif\if@twocolumn
\@twocolumnfalse
\DeclareOption{twocolumn}{\@twocolumntrue}

\newif\if@twoside
\@twosidefalse
\DeclareOption{twoside}{\@twosidetrue}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[fontset = \@fontset, zihao = \@fontsize]{ctex}
\ctexset{linestretch = 4, autoindent = 0pt}

%                    *****************************
%                    **  EXTRA REQUIRED PACKAGE **
%                    *****************************

\RequirePackage{amsmath,amssymb,amsthm,bm,bbding,pifont,dsfont,kpfonts,mathtools}
\RequirePackage{paralist,cases,tabularx}
\RequirePackage{pstricks,pst-plot,xcolor,graphicx}
\RequirePackage{geometry,caption}
\captionsetup[figure]{font=small,skip=2pt}




%                         *****************
%                         ** PAGE LAYOUT **
%                         *****************

\RequirePackage{geometry,fancyhdr}

\if@twocolumn
\geometry{landscape,twocolumn}
\setlength{\columnsep}{2cm}
\fi

\if@twoside
\geometry{twoside}
\fi

\if@printmargin
\geometry{hmargin={4cm,2cm},vmargin={2cm,2cm}}
\setlength{\marginparwidth}{2cm}
\reversemarginpar
\else
\geometry{hmargin={2cm,2cm},vmargin={2cm,2cm}}
\setlength{\marginparwidth}{2cm}
\fi

\newsavebox{\mlbox}
\sbox{\mlbox}{
	\begin{minipage}{0.7\paperheight}
		\begin{center}
			\heiti
			班级 \underline{\hspace{15ex}} \quad
			姓名 \underline{\hspace{15ex}} \quad
			学号 \underline{\hspace{15ex}} \quad \\
			\vspace{3ex}
			\dotfill 装 \dotfill 订 \dotfill 线 \dotfill
		\end{center}
	\end{minipage}
}

\newcommand{\printml}{
	\marginpar{\rotatebox{90}{\usebox{\mlbox}}}
}

\renewcommand*{\title}[1]{\gdef\@title{#1}}
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\notice}[1]{\gdef\@notice{#1}}
\renewcommand*{\author}[1]{\gdef\@author{#1}}
\renewcommand*{\date}[1]{\gdef\@date{#1}}
\newcommand*{\logo}[1]{\gdef\@logo{#1}}
\renewcommand\maketitle{\begingroup
	\renewcommand{\baselinestretch}{2}
	\newpage
	\if@printmargin \printml \fi
	\global\@topnum\z@ 	% Prevents figures from going at top of page.
	\begin{minipage}{0.1\textwidth}
		\includegraphics[width=1.5cm]{\@logo}
	\end{minipage}
	\begin{minipage}{0.9\textwidth}
	\begin{center}
		\heiti \Large
		\@title \par
		\@subtitle \par
		\fbox{\normalsize \@notice} \par
		\songti \normalsize \@author \par
	\end{center}
	\end{minipage}
	\begin{flushright}
		\small \@date \par
	\end{flushright}
	\songti \normalsize
\endgroup}

\renewcommand\arraystretch{1.5}
\renewcommand{\baselinestretch}{1.5}








%                    ***************************
%                    ** QUESTION ENVIRONMENTS **
%                    ***************************

\newcounter{Group}
\newcounter{Question}
\newcounter{Subquestion}[Question]
\newcounter{Method}[Question]
\newif\if@showscore
\@showscorefalse
\newif\if@showskip
\@showskipfalse

\newenvironment{groups}{
	\par \begingroup
}{
	\par \endgroup \par
}

\newcommand{\group}[2]{
	\stepcounter{Group} \heiti{\par \chinese{Group} 、#1} \small{\kaishu \par #2} \songti \normalsize
}

\newenvironment{questions}[1][]{
	\@tfor \@opt :=#1\do
		{\if\@opt s\global\@showscoretrue\fi
		 \if\@opt t\global\@showskiptrue\fi}
	\par \begingroup \par
}{
	\par \endgroup \par
	\global\@showscorefalse
	\global\@showskipfalse
}

\newcommand{\question}[1][0]{
	\stepcounter{Question} \vspace{5mm} \par \arabic{Question}.  \if@showscore \kaishu ( #1 分) \songti \fi
}

\newenvironment{subquestions}{
	\par \songti \begingroup \par
}{
	\par \endgroup \par
}

\newcommand{\subquestion}[1][0]{
	\stepcounter{Subquestion} \par (\arabic{Subquestion}) 
} 

\newenvironment{solution}{
	\par \if@printanswers \par \color{red} \begingroup \else \if@showskip \vspace{8cm} \fi \setbox\z@\vbox\bgroup\fi \songti
}{
	\par \if@printanswers \endgroup \color{black} \else \egroup \fi \par
}
	
\newcommand{\method}{
	\stepcounter{Method}
		\par \fbox{\heiti{解法\chinese{Method}}} \par \songti
	}
	
\newcommand{\methodonly}{
	\par \fbox{\heiti{解答}} \par \songti}

\newcommand{\score}[2]{
	\par
	\dotfill 本步骤 #1 分， 累计 #2 分
	\par}


\newcommand{\stk}[1]{
	\if@printanswers
	\underline{~#1~}
	\else
	\underline{~\hspace{1cm}~}
	\fi}
\newcommand{\mtk}[1]{
	\if@printanswers
	\underline{~#1~}
	\else
	\underline{~\hspace{2cm}~}
	\fi}
\newcommand{\ltk}[1]{
	\if@printanswers
	\underline{~#1~}
	\else
	\underline{~\hspace{3cm}~}
	\fi}

\newcommand{\onech}[4]{
	\par
	\begin{tabularx}{\linewidth}{XXXX}
		\setlength\tabcolsep{0pt}
		(A) #1 & (B) #2 & (C) #3 & (D) #4 \\
	\end{tabularx}
	\unskip \unskip}
\newcommand{\twoch}[4]{
	\par
	\begin{tabularx}{\linewidth}{XX}
		\setlength\tabcolsep{0pt}
		(A) #1 & (B) #2 \\
		(C) #3 & (D) #4
	\end{tabularx}
	\unskip \unskip}
\newcommand{\fourch}[4]{
	\par
	\begin{tabularx}{\linewidth}{X}
		\setlength\tabcolsep{0pt}
		(A) #1 \\
		(B) #2 \\
		(C) #3 \\
		(D) #4 \\
	\end{tabularx}
	\unskip \unskip}


%                    ***************************
%                    **   CUSTOMIZED COMMAND  **
%                    ***************************

\newcommand\abs[1]{\left|#1\right|}
\newcommand{\gt}{>}
\newcommand{\lt}{<}
\newcommand{\overparen}{\widearc}
\renewcommand{\geq}{\geqslant}
\renewcommand{\ge}{\geqslant}
\renewcommand{\leq}{\leqslant}
\renewcommand{\le}{\leqslant}


\endinput
