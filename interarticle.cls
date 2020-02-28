%
% Author: Cristóbal Tapia Camú
% E-mail: cristobal.tapia-camu@mpa.uni-stuttgart.de
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\RCSfile{interarticle}%
\def\RCSversion{1.0.0}%
\def\RCSdate{2018/05/04}%
\def\@shortjnl{\relax}
\def\@journal{INTER}
\def\@company{INTER}
\def\@issn{000-0000}
\def\@shortjid{interarticle}
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base class: Article
\LoadClass[a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options
\newif\ifunicodemath
\newif\ifmicrotype
\microtypefalse
%
\DeclareOption{unicode-math}{\unicodemathtrue}
\DeclareOption{no-unicode-math}{\unicodemathfalse}
\DeclareOption{microtype}{\microtypetrue}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Used packages
\RequirePackage{polyglossia}
\RequirePackage{fontspec}
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage{csquotes}
\RequirePackage[
  style=authoryear,
  backend=biber,
  natbib=true,
  maxcitenames=2,
  maxbibnames=9,
  mincitenames=1,
  uniquelist=minyear,
]{biblatex}
\RequirePackage{lmodern}
\RequirePackage{listings}
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{emp}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{textcase}
\RequirePackage[keeplastbox,nospread]{flushend}
\RequirePackage{stfloats}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{nopageno}
\RequirePackage{etoolbox}
\RequirePackage{ragged2e}
\RequirePackage{siunitx}
\RequirePackage{threeparttable}
\RequirePackage[hidelinks]{hyperref}
% \RequirePackage{fancyhdr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Activate microtype if desired
\ifmicrotype%
  \RequirePackage{microtype}
\fi

% Use unicode-math if requested
\ifunicodemath%
  \RequirePackage{unicode-math}%
\else
  \RequirePackage[italic]{mathastext}
\fi

\DeclareSIUnit{\SIUnitSymbolDegree}{\text{°}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set the default font and font options
\setmainfont{Calibri, Light}[
  Mapping=tex-text,
  Scale=1.000,
  ItalicFont={* Italic},
  BoldFont={Calibri},
  BoldItalicFont={Calibri, Italic},
]

% Set math-font if unicode-math is used
\ifunicodemath%
  \setmathfont[
    Path=fonts/,
    Extension=.otf,
  ]{latinmodern-math}% for the symbols
  \setmathfont[range=\mathup/{num,latin,Latin,greek,Greek}]{Calibri Light}%
  \setmathfont[range=\mathbfup/{num,latin,Latin,greek,Greek}]{Calibri}%
  \setmathfont[range=\mathit/{num,latin,Latin,greek,Greek}]{Calibri Light Italic}%
  \setmathfont[range=\mathbfit/{num,greek,Greek}]{Calibri Italic}%
  % Set font for special characters
  \setmathfont[range={%
      %\mathplus, \pm, \times, \fracslash, \minus, \divslash
      "0002B,"000B1,"000D7,"02044,"02212,"02215,%
      % \mathslash, \mathperiod, 
      "0002F,"0002E%
  }]{Calibri Light}%
\else
  % Set mathastext
  \Mathastext%

\fi

\defaultfontfeatures{Ligatures=TeX}

% \setdefaultlanguage[variant=us]{english}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Line spacing
% \renewcommand{\baselinestretch}{1.5}
\linespread{1.5}
\setlength\parskip{6pt}

\patchcmd\set@fontsize
{\f@linespread\baselineskip}
{\f@linespread\baselineskip plus 1.6\p@ minus 0.3\p@}
{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine "\and" command
\def\and{%      % \begin{tabular}[t]{c}
\end{tabular}%
\vskip 0pt%
\hspace{-0.4em}%
\begin{tabular}[t]{l}%
}%              % \end{tabular}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine the generation of the title
\def\@maketitle{%
  \newpage
  \null
  \begin{FlushLeft}%
    \let\footnote\thanks%
    \vskip -30pt%
    \setlength\lineskip{11pt}%
    {\parbox{\textwidth}{\linespread{2.17}\bfseries\Large\@title}}\par%
    \vskip 20pt%
    {\normalsize
      \hspace{-0.4em}%
      \begin{tabular}[t]{l}%
        \@author
      \end{tabular}%
    }%
    \vskip 47pt%
  \end{FlushLeft}%
  \par
}
\setlength{\parindent}{0em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set mathindent to 0
\setlength\mathindent{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Keywords
\providecommand{\keywords}[1]{\parbox{\textwidth}{Keywords: #1}%
\vspace{24pt}}
% Define "\sep" command (used in the keywords)
\newcommand{\sep}{,\, }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format for the captions of tables and figures
% Caption setup for the tables
\captionsetup{tableposition=top}
\captionsetup[table]{%
  labelfont={small,it},
  textfont={small,it},
  justification=RaggedRight,
  skip=6pt,
  position=top,
  labelsep=period,
  singlelinecheck=false,
}

% Caption setup for the figures
\captionsetup[figure]{%
  labelfont={small,it},
  textfont={small,it},
  justification=RaggedRight,
  skip=6pt,
  labelsep=period,
  singlelinecheck=false,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format of the sections, subsections and sub-subsections
\setcounter{secnumdepth}{4}
% Section
\titleformat{name=\section}[hang]{\bfseries\RaggedRight\large}%
{\parbox{1.5cm}{\thesection}}{0cm}%
{}%
\titlespacing{\section}{0pt}{14pt \@plus 4pt \@minus 4pt}{0pt \@plus 3pt \@minus 3pt}

% Sub-Section
\titleformat{name=\subsection}[hang]{\bfseries\RaggedRight\normalsize}%
{\parbox{1.5cm}{\thesubsection}}{0.0cm}%
{}%
\titlespacing{\subsection}{0pt}{14pt \@plus 4pt \@minus 4pt}{0pt \@plus 3pt \@minus 3pt}

% Subsub-Section
\titleformat{name=\subsubsection}[hang]{\itshape\bfseries\RaggedRight\normalsize}%
{\parbox{1.5cm}{\thesubsubsection}}{0.0cm}%
{}%
\titlespacing{\subsubsection}{0pt}{14pt \@plus 3pt \@minus 3pt}{0pt \@plus 2pt \@minus 2pt}

% Subsubsub-Section
\titleformat{name=\paragraph}[hang]{\RaggedRight\normalsize}%
{\parbox{1.8cm}{\theparagraph}}{0.0cm}%
{}%
\titlespacing{\paragraph}{0pt}{6pt \@plus 1pt \@minus 1pt}{0pt \@plus 1pt \@minus 1pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geometry of the page
\RequirePackage{geometry}
\geometry{%
  twoside,%
  paperwidth=210mm,%
  paperheight=297mm,%
  centering,%
  top=20mm,%
  bottom=20mm,%
  left=20mm,%
  right=20mm,%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine the standard font sizes
\renewcommand{\tiny}{\fontsize{9pt}{11}\selectfont}
\renewcommand{\footnotesize}{\fontsize{11pt}{11}\selectfont}
\renewcommand{\small}{\fontsize{12pt}{11}\selectfont}
\renewcommand{\normalsize}{\fontsize{14pt}{12pt \@plus 1pt \@minus 1pt}\selectfont}
\renewcommand{\large}{\fontsize{22pt}{14}\selectfont}
\renewcommand{\Large}{\fontsize{28pt}{16}\selectfont}

% Set size of the table notes for threeparttable
\g@addto@macro\TPT@defaults{\footnotesize} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citing
\DeclareCiteCommand{\citet}{\usebibmacro{prenote}}%
{{\ifentrytype{misc}{}{\itshape}\printnames{labelname}}%
  \setunit{\addspace} % space delimiter
(\setunit{\unspace}\printfield[bibhyperref]{year})}
{\multicitedelim}%
{\usebibmacro{postnote}}

\DeclareCiteCommand{\citep}{(\usebibmacro{prenote}}%
  {{\ifentrytype{misc}{}{\itshape}\printnames{labelname}}%
    \setunit{\addcomma\addspace}% comma delimiter
  \printfield[bibhyperref]{year}}
  {\multicitedelim}%
{\usebibmacro{postnote})}


\endinput
%
