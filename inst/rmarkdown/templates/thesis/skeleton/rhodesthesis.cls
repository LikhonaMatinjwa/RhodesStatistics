%
% Rhodes University thesis templats
% Date: 31/03/2020
% Author: Fabio Mathias Correa, f.correa@ru.ac.za
%
% This template is adapted from thesidown and similar university specific adaptations
%
% Format of dissertations for research degrees:
%
% Preliminary pages:
% The five preliminary pages must be single sided and as follows:
% 1. Title Page
% 2. Abstract
% 3. Dedication and Acknowledgements
% 4. Table of Contents
%
% 1. Title Page
% a) At the top should be the title (if necessary the sub-title and volume number). If thesis in another language give the original language title followed by the English language title
% b) The full name of the author should be in the centre of the page
% c) At the bottom centre should be the words "“A dissertation submitted to the Rhodes University in accordance with the requirements for award of the degree of...in the Faculty of...”
% d) the name of the school and month and year of submission
% e) the word count (text) should be entered at the bottom right of the page
%
% 2. Abstract
% a) One side of A4
% b) single spaced
% c) font size 10-12
% e) if theiss in different language to english give it in original and english
%
% 3. Dedication and Acknowledgments
% The uni provides no information on the content of this section
%
% 4. Table of Contents
% a) must list (with page numebrs):
%   (i) all chapters
%   (ii) all sections
%   (iii) all subsections
%   (iv) references
%   (v) bibliography
%   (vi) list of abbreviations
%   (vii) appendices
%
% 5. Table of Tables and Table of Figures
% a) this should follow the ToC
% b) must inclde the page numbers
%
%
% Other formalitis
% 1. A4
% 2. Double sided (except for the 5 pages above)
% 3. Text should be 2 or 1.5 line spaced
% 4. Font size should be chosen to ensure clarity and legibility for the main text and for any quotes and footnotes
% - my interpretation of this is that we will go with 11 for font size just because
% 5. Margins should allow for eventual hard binding
%  - my interpretation of this is ? so i asked print services who do the printing and they said "Thank you for your message. For binding purposes, a margin of 20mm is fine."
%
%
% Thats it for guidance from the university. This file will (hopefully) conform to this and wont be rejected!
%
%
%
%
%
%


%%% Probably best to leave this bit as is
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rhodesthesis}[]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}
\RequirePackage{fancyhdr}
\RequirePackage{fancyvrb}
\usepackage{ifxetex,ifluatex}
\usepackage{fixltx2e} % provides \textsubscript
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[T1]{fontenc}
  \usepackage[utf8]{inputenc}
\else % if luatex or xelatex
  \ifxetex
    \usepackage{mathspec}
    \usepackage{xltxtra,xunicode}
  \else
    \usepackage{fontspec}
  \fi
  \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
  \newcommand{\euro}{€}
\fi
% use upquote if available, for straight quotes in verbatim environments
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
% use microtype if available
\IfFileExists{microtype.sty}{%
\usepackage{microtype}
\UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
\usepackage{color}
%\newcommand{\VerbBar}{|}
%\newcommand{\VERB}{\Verb[commandchars=\\\{\}]}
\DefineVerbatimEnvironment{verbatim}{Verbatim}{xleftmargin=-1em}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}}
% Add ',fontsize=\small' for more characters per line
\usepackage{framed}
\definecolor{shadecolor}{RGB}{248,248,248}

\setlength{\emergencystretch}{3em}  % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
% End of CII add

% This gives us rules below the headers
\AtBeginDocument{%
  \fancyhf{}
  \fancyhead[LE,RO]{\thepage}
%  \fancyhead[RE]{\slshape \leftmark}
%  \fancyhead[LO]{\slshape \rightmark}
%	The above makes your headers in all caps. If you would like different headers, choose one of the following options (be sure to remove the % symbol from both the right and left headers):
	 \fancyhead[RE]{\slshape \nouppercase \leftmark} % This makes the headers on the RIGHT side pages be italic and use lowercase With Capitals When Specified.
	\fancyhead[LO]{\slshape \nouppercase \rightmark} % This does the same thing to the LEFT side pages
%	or
%	\fancyhead[RE]{\scshape \leftmark} % The RIGHT headers will be in small caps.
%	\fancyhead[LO]{\scshape \rightmark} %  And so will the LEFT headers
  \pagestyle{fancy}

% Psych majors: You do not need the following six lines, as it conflicts with apacite, so comment them out.
  \let\oldthebibliography=\thebibliography
  \let\endoldthebibliography=\endthebibliography
  \renewenvironment{thebibliography}[1]{
    \oldthebibliography{#1}
    \addcontentsline{toc}{chapter}{\bibname}
  }{\endoldthebibliography}
 %%%%%% end of things for psych majors to comment out

  \let\oldtheindex=\theindex
  \let\endoldtheindex=\endtheindex
  \renewenvironment{theindex}{
    \oldtheindex
    \addcontentsline{toc}{chapter}{\indexname}
  }{\endoldtheindex}
}

% Stolen from book.cls and modified
\let\RToldchapter\chapter
\renewcommand{\chapter}{\if@openright\RTcleardoublepage
		    \else\clearpage\fi
		    \thispagestyle{empty}%
		    \global\@topnum\z@
		    \@afterindentfalse
		    \secdef\@chapter\@schapter}

% Stolen from book.cls PBC 5/12/05
% Using this to actually show "Chapter 1" in TOC instead of "1"
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                         {\@chapapp\space\thechapter:\space#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\newcommand{\RTcleardoublepage}{
	\clearpage\if@twoside \ifodd\c@page\else
	\thispagestyle{empty}\hbox{}\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\let\RToldcleardoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{\RTcleardoublepage}

%%% Margins
\oddsidemargin 15truemm
\evensidemargin 0truemm
\topmargin 0truemm
\headsep 10truemm
%%

%% Defined terms
\def\university#1{\gdef \@university{#1}}
\def\faculty#1{\gdef \@faculty{#1}}
\def\school#1{\gdef \@school{#1}}
%%\def\group#1{\gdef \@group{#1}}
\def\wordcount#1{\gdef \@wordcount{#1}}
\def\logo#1{\gdef \@logo{#1}}
\def\degree#1{\gdef \@degree{#1}}
%%


\renewcommand\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\normalfont
      \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\bfseries \hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

%%% Preface pages
% in order

%% Title page
\renewcommand{\maketitle}{%
  {\pagestyle{empty}
  \fontsize{12}{14}\selectfont
  \begin{titlepage}
  \newpage
  \begin{center}
    \setcounter{page}{1}
    \includegraphics[scale=0.2] \@logo \\
    \vspace{1.5cm}
    {\fontfamily{pbk}\fontsize{24}{24}\selectfont \@title}
    \vfil
    \centerline{\hbox to \wd0 {\hbox{}\hrulefill\hbox{}}}
    \vfil
    {\fontfamily{pbk}\fontsize{18}{18}\selectfont \@author} \\
    \vspace{0.5cm}
    {\fontfamily{pbk}\fontsize{14}{14}\selectfont \@university} \\
    {\fontfamily{pbk}\fontsize{14}{14}\selectfont Faculty of \@faculty} \\
    {\fontfamily{pbk}\fontsize{14}{14}\selectfont \@school}
    \vfil
    \bigskip
    A dissertation submitted to the Rhodes University in accordance with the requirements for award of the degree of \@degree \ in the Faculty of \@faculty \\
    \vfil
    \bigskip
    {\fontsize{12}{14}\selectfont \lineskip .5em
    \begin{tabular}[t]{c}%
    \end{tabular}\par}
    \vskip 1em
    {\fontsize{12}{14}\selectfont \@date}
  \end{center}\par
  \end{titlepage}
  }
}

%% Abstract
\newenvironment{abstract}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Abstract}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%

%% Acknowledgments
\newenvironment{acknowledgements}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Acknowledgements}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%

%%Declaration
\newenvironment{declaration}{%
  \if@twocolumn
   \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Declaration}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%

%% Abbreviations/accronyms
\newenvironment{abbreviations}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Abbreviations}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%


%%% Other things
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Acknowledgements}[1]{\def\@Acknowledgements{#1}}
\newcommand{\Declaration}[1]{\def\@Declaration{#1}}
\newcommand{\Abbreviations}[1]{\def\@Abbreviations{#1}}
