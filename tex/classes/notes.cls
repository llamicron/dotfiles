\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2022/11/14 Luke's Note Template]

\LoadClass{article}

% Path to the directory of the other class files
\newcommand{\class}[1]{\input{/home/llamicron/etc/tex/classes/#1}}

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
\class{notes/code_listings.cls}
% Provides elements like \hr
\class{notes/elements.cls}
% Math stuff
\class{notes/math_symbols.cls}

%%%%%%%%%%%%%%%%%%%%%%
% Misc Congiguration %
%%%%%%%%%%%%%%%%%%%%%%

% This makes only sections and above have section numbers
% I don't like numbered subsections.
\setcounter{secnumdepth}{1}

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

