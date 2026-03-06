% kthpq-thesis is marked CC0 1.0 Universal. To view a copy of this mark,
% visit https://creativecommons.org/publicdomain/zero/1.0/

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{kthpq-thesis}[2025/12/12 KTH PhD thesis class]

\RequirePackage{iftex}
\ifluatex
\else
  \ifxetex
  \else
    % Raise fatal error: https://tex.stackexchange.com/a/666538/216213
    \ExplSyntaxOn
      \msg_new:nnn {kthpq-thesis}{unsupported-engine}{
        The~class~kthpq-thesis~requires~LuaLaTeX~(XeLaTeX~might~also~work,~but~
        is~not~directly~supported).~Please~change~your~typesetting~engine~to~
        "lualatex"~or~similar.
      }
      \msg_fatal:nn {kthpq-thesis}{unsupported-engine}
    \ExplSyntaxOff
  \fi
\fi

\RequirePackage{kvoptions}

% Options
\SetupKeyvalOptions{
  family=kthpqthesis,
  prefix=kthpqthesis@
}
\DeclareStringOption[auto]{figtreepath}

\ProcessKeyvalOptions{kthpqthesis}

\PassOptionsToPackage{figtreepath=\kthpqthesis@figtreepath}{kthpq/kthpq-font}

\PassOptionsToPackage{cmyk}{kthpq/kthpq-color}
\DeclareOption{HTML}{\PassOptionsToPackage{\CurrentOption}{kthpq/kthpq-color}}
\DeclareOption{cmyk}{\PassOptionsToPackage{\CurrentOption}{kthpq/kthpq-color}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

\LoadClass[12pt]{book}

% ==== PAPER ====

% The Word template (A4 paper) has the following margins (mm):
%   top 36, bottom 30, inner 43, outer 22
% We adjust for G5 paper (169 x 239 mm):
\RequirePackage[
  paperwidth=169mm,
  paperheight=239mm,
  twoside,
  top=29.0mm,
  bottom=24.1mm,
  inner=35.6mm,
  outer=18.7mm,
  headsep=10mm,
  headheight=10mm,
  footskip=10mm
]{geometry}

% ==== END PAPER ====

% ==== COLORS ====

\RequirePackage{kthpq/kthpq-color}

% ==== END COLORS ====

% ==== FONTS =====

\RequirePackage{kthpq/kthpq-font}

% ==== END FONTS ====

% ==== HEADER & FOOTER ====

\RequirePackage{emptypage}% Suppress page numbers on otherwise empty pages
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}% reset
% Set up the header and footer
\fancyhead[RO]{\sffamily\small\rightmark}
\fancyhead[LE]{\sffamily\small\leftmark}
\fancyfoot[LE,RO]{\sffamily\small\thepage}% Left for even pages, right for odd pages

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[LE,RO]{\sffamily\small\thepage}% Left for even pages, right for odd pages
}

% ==== END HEADER & FOOTER ====

% ==== TITLES & SECTIONS ====

\RequirePackage{titlesec}
\setcounter{secnumdepth}{3} % Add numbers to subsubsections

\titleformat{\part}
  {\sffamily\fontsize{36pt}{36pt}\selectfont\bfseries\color{KTH blue}}
  {}{0em}{}

\titleformat{\chapter}
  {\fontsize{24pt}{24pt}\selectfont\mediumsf\raggedright}% Figtree Semibold, exact 24pt
  {\makebox[0pt][r]{\thechapter\hspace{8mm}}}{0em}{}

\titleformat{\section}
  {\sffamily\fontsize{13pt}{13pt}\selectfont\bfseries}% Figtree Semibold, 13pt
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\sffamily\fontsize{12pt}{12pt}\selectfont\bfseries}% Figtree Semibold, 13pt
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\sffamily\fontsize{12pt}{12pt}\selectfont\bfseries\itshape}
  {\thesubsubsection}{1em}{}

% Remove page number from part
\assignpagestyle{\part}{empty}

% In the Word template, the space above chapter titles is ~60mm. Scale it:
\titlespacing*{\chapter}{0pt}{50mm}{16pt plus 2pt minus 2pt}

% ==== END TITLES & SECTIONS ====

% ==== TABLE OF CONTENTS ====

\RequirePackage[titles]{tocloft}

% Vertical spacing in ToC
\setlength{\cftbeforechapskip}{1ex}
\setlength{\cftbeforesecskip}{0.5ex}

% Font
\def\tocfont{\sffamily}
\renewcommand{\cftpartfont}{\tocfont\bfseries\large}
\renewcommand{\cftchapfont}{\tocfont\bfseries}
\renewcommand{\cftsecfont}{\tocfont}
\renewcommand{\cftsubsecfont}{\tocfont}
\renewcommand{\cftfigfont}{\tocfont}
\renewcommand{\cfttabfont}{\tocfont}

% Page number font
\renewcommand{\cftpartpagefont}{\tocfont\bfseries}
\renewcommand{\cftchappagefont}{\tocfont\mdseries}
\renewcommand{\cftsecpagefont}{\tocfont}
\renewcommand{\cftsubsecpagefont}{\tocfont}
\renewcommand{\cftfigpagefont}{\tocfont}
\renewcommand{\cfttabpagefont}{\tocfont}

% Leader
\def\tocleader{\sffamily\cftdotfill{\cftdotsep}}
\renewcommand{\cftpartleader}{\hfill}
\renewcommand{\cftchapleader}{\hfill}
\renewcommand{\cftsecleader}{\tocleader}
\renewcommand{\cftsubsecleader}{\tocleader}
\renewcommand{\cftfigleader}{\tocleader}
\renewcommand{\cfttableader}{\tocleader}

% ---- Patch the ToC/LoF/LoT commands to make them appear in the ToC ----
% Manually rewrite \tableofcontents (see https://github.com/latex3/latex2e/issues/54)
\renewcommand\tableofcontents{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\contentsname
      \@mkboth{%
         \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \addcontentsline{toc}{chapter}{\contentsname}%
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi%
}
% Patch the others
\RequirePackage{etoolbox}

\newcommand{\addchap}[1]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{#1}%
}
\patchcmd{\listoffigures}{\chapter*}{\addchap}{}{}
\patchcmd{\listoftables}{\chapter*}{\addchap}{}{}

% ==== END TABLE OF CONTENTS ====

% ==== FRONT MATTER ====

\def\@subtitle{}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}

\renewcommand{\maketitle}{%
  \newgeometry{top=30mm,bottom=30mm,left=24mm,right=18mm}
  \begin{titlepage}
    \raggedright\sffamily%
    \vspace*{25mm}%
    \Huge\bfseries\@title\\
    \ifx\@subtitle\@empty\relax
    \else%
        \vspace{3mm}%
        \mediumsf\fontsize{14pt}{15.68pt}\selectfont\@subtitle\\
    \fi
    \vspace{8mm}
    \normalsize\bfseries\expandafter\MakeUppercase\expandafter\@author\\
    \vspace{20mm}
    \fontsize{10pt}{10pt}\selectfont\mdseries
    Academic Dissertation which, with due permission of the KTH Royal Institute of Technology, is submitted for public defense for the Degree of Doctor of Philosophy at a Future Time in a Future Place.\\
    \vfill
    \footnotesize
    Doctoral Thesis in a Program\\
    KTH Royal Institute of Technology\\
    Stockholm, Sweden \the\year
  \end{titlepage}
  \restoregeometry
}

\def\@copyrighttext{%
  All Rights Reserved. No part of this work may be reproduced in any form without the written permission of the copyright owner.\par
  Published articles have been reprinted with permission from their respective copyright holders.%
}
\newcommand{\copyrighttext}[1]{\def\@copyrighttext{#1}}

\newcommand{\makecopyright}{{% double brace to isolate typestting
  \thispagestyle{empty}
  \raggedright\sffamily
  \vspace*{\fill}\par% Fills the vertical space
  \fontsize{10pt}{10pt}\selectfont
  \textcopyright{} \@author~\the\year{}\par
  \@copyrighttext\\
  \vspace{5mm}
  TRITA-ABC-DEF YYYY:XX\\
  ISBN 987-65-4321-012-8\\
  Printed by Universitetsservice US-AB, Sweden \the\year{}%
}}

% ---- Dedication with key-value options ----
% Usage: \begin{dedication}[align=r,stretch=2]...\end{dedication}
\newenvironment{dedication}[1][]{%
  \setkeys{kthpq@dedication}{#1}%
  \cleardoublepage%
  \thispagestyle{empty}%
  \vspace*{\stretch{1}}%
  \kthpq@dedication@align%
  \normalfont\itshape%
}{%
  \par%
  \vspace{\stretch{\kthpq@dedication@stretch}}%
  \newpage%
}

% Use the built-in keyval package: https://tex.stackexchange.com/a/34314/216213
\define@key{kthpq@dedication}{stretch}{\def\kthpq@dedication@stretch{#1}}
\define@key{kthpq@dedication}{align}{%
  \ifx#1c%
    \def\kthpq@dedication@align{\centering}%
  \else%
    \ifx#1l%
      \def\kthpq@dedication@align{\raggedright}%
    \else%
      \def\kthpq@dedication@align{\raggedleft}%
    \fi%
  \fi%
}
\setkeys{kthpq@dedication}{align=r,stretch=2}
% ---- end dedication ----

\RequirePackage[swedish,main=english]{babel}
\RequirePackage{csquotes}

% Usage: \begin{abstract}[english]...\end{abstract}
\newenvironment{abstract}[1][\mainlocalename]{%
  \selectlanguage{#1}% set language locally
  \chapter*{\abstractname}%
  \addcontentsline{toc}{chapter}{\abstractname}%
}{}

\newcommand{\keywords}[1]{%
  \par%
  \vspace{0.5\baselineskip}%
  \noindent\textbf{\iflanguage{swedish}{Nyckelord}{Keywords}}\\%
  \noindent#1%
}

% ==== END FRONT MATTER ====

% ==== BONUS ENVIRONMENTS ====

% Usage: \begin{paperabstract}[.9\textwidth]...\end{paperabstract}
\newenvironment{paperabstract}[1][.9\textwidth]{%
  \begin{center}
  \begin{minipage}{#1}%
  \footnotesize%
  {\centering\sffamily\bfseries Abstract\par}\noindent
}{%
  \end{minipage}
  \end{center}
  \par\@afterindentfalse\@afterheading% suppress subsequent indent: https://tex.stackexchange.com/a/126487/216213
}

% Usage: \begin{colophon}[.5\textwidth]...\end{colophon}
\newenvironment{colophon}[1][.5\textwidth]{%
  \cleardoublepage
  \thispagestyle{empty}
  \centering
  \vspace*{\fill}
  \noindent\begin{minipage}{#1}%
}{%
  \end{minipage}
  \vfill
}

% ---- Format LuaTeX banner: https://tex.stackexchange.com/a/350583/216213 ----
\RequirePackage{xstring}

\StrBehind{\luatexbanner}{\detokenize{This is }}[\@formattedluatexbanner]
\StrSubstitute{\@formattedluatexbanner}{\detokenize{TeX}}{\TeX}[\formattedluatexbanner]

% ==== END BONUS ENVIRONMENTS ====

% ==== FLOATS ====

% Word template prescribes 9pt, footnotesize (for 12pt normal) is 10pt. Close enough!
\RequirePackage[font=footnotesize]{caption}

% ==== END FLOATS ====

% ==== LISTS ====
\RequirePackage{enumitem}

% prescribed 10mm margin (which we scale down), 1.25pt paragraph spacing
\setlist{leftmargin=8mm,itemindent=0pt,itemsep=0pt,parsep=1.25pt}

% ==== END LISTS ====

\endinput