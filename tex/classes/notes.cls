\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2022/11/14 Luke's Note Template]

\LoadClass{article}

% Path to the directory of the other class files
\newcommand{\classRoot}{/home/llamicron/etc/tex/classes}
\newcommand{\class}[1]{\input{\classRoot/#1}}

%%%%%%%%%%%%%%%%%
% Configuration %
%%%%%%%%%%%%%%%%%

% These are all imported files that provide commands or do some configuration


% Import all packages from notes/packages.cls
\class{notes/packages.cls}
% First page styles
% Provides \notesHeader and \anonNotesHeader
\class{notes/first_page_style.cls}
% Page size
\class{notes/page_size.cls}
% Code listing styles
% We actually don't need this anymore because I switched to minted for code listings
\class{notes/code_listings.cls}
% Provides elements like \hr
\class{notes/elements.cls}
% Math stuff
\class{notes/math_symbols.cls}

%%%%%%%%%%%%%%%%%%%%%%
% Misc Configuration %
%%%%%%%%%%%%%%%%%%%%%%

% Just the Asana symbol
\newcommand*\asanaSymbol{\includegraphics[width=1em]{\classRoot/notes/asana.png}\space}

% Asana symbol in a framed box for follow up tasks
\newcommand*\asana[1]{
    \vspace{0.5cm}
    \begin{framed}
        \vcenter{\hbox{\includegraphics[width=1.8em]{\classRoot/notes/asana.png}}}
        \hspace{0.5cm}
        \parbox{\textwidth-1cm}{#1}
    \end{framed}
    \vspace{0.5cm}
}

% Set the font
% See here for more easy font options: https://tug.org/FontCatalogue/mathfonts.html
\usepackage{arev}
\usepackage[T1]{fontenc}


% This makes only sections and above have section numbers
% I don't like numbered subsections.
\setcounter{secnumdepth}{1}

% Stretches table cells vertically by the factor given, used to basically add padding
\renewcommand{\arraystretch}{1.6}

% Styling links
% \href{https://youtube.com}{example}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,
    urlcolor=cyan,
}

% Theorems and definitions
\newtheorem{theorem}{Theorem}
\newtheorem{definition}{Definition}

