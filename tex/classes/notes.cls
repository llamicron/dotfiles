\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2022/11/14 Luke's Note Template]

\LoadClass{article}

%%%%%%%%%%%%
% Packages %
%%%%%%%%%%%%
% For code listings
\usepackage{listings}
% not sure what i use these for honestly, too lazy to figure out
% \usepackage{graphicx}
% \usepackage{gensymb}
% A few math tools that I sometimes use
\usepackage{mathtools}
% For circuit symbols (used in PHYS 1444 and probably later)
% \usepackage{circuitikz}
% This is just for tables
\usepackage{tabularx}
% The magical math package, used for a lot of shit
\usepackage{amsmath}
% More math symbols
\usepackage{amssymb}
% For framed boxes
% \begin{framed}
% example
% \end{framed}
\usepackage{framed}
% For the header bar
\usepackage{fancyhdr}
% For coordinate system
% Uncomment if you need this, its big i think
% \usepackage{tkz-euclide}
% This package is used for drawing node graphs
% Uncomment if you need it. See the guide here:
% https://www.baeldung.com/cs/latex-drawing-graphs
% \usepackage{tikz}
% This one is for CSE 2315
% This was for the way our prof wanted homework formatted.
% Steps needed to be tabbed to a certain width.
% \usepackage{tabto}
% I think this one makes everything \noindent
\usepackage{parskip}
% Styling links
% \href{https://youtube.com}{example}
\usepackage{hyperref}
% Colored boxes
\usepackage{tcolorbox}
% Enumeration
% \usepackage{enumitem}
% Fancy ornaments
\usepackage[object=vectorian]{pgfornament}
% For current date and time
\usepackage{datetime2}

%%%%%%%%%%%%%%%%%
% Configuration %
%%%%%%%%%%%%%%%%%

% first page style
\renewcommand{\footrulewidth}{0.5pt}
% This is the top bar
% Example
% \notesHeader{SQL Select Statements}{CSE 3330}{Guizani}
\newcommand{\notesHeader}[3]{
    \fancypagestyle{firstPageStyle}
    {
        \pagestyle{fancy}
        \fancyhf{}
        
        \lhead{#1}
        \chead{}
        \rhead{#2 --- Prof. #3}
        
        \lfoot{Luke Sweeney}
        \cfoot{upd. \today}
        \rfoot{\thepage}
    }
    \thispagestyle{firstPageStyle}
}

% Anonymous notes header, without my name
% This is useful if I'm sharing notes with a group of people
% and I may not want them to track it back to me
\newcommand{\anonNotesHeader}[3]{
    \fancypagestyle{firstPageStyle}
    {
        \pagestyle{fancy}
        \fancyhf{}
        
        \lhead{#1}
        \chead{}
        \rhead{#2 --- Prof. #3}
        
        \lfoot{}
        \cfoot{upd. \today}
        \rfoot{\thepage}
    }
    \thispagestyle{firstPageStyle}
}


% Fancy ornament
% Example: \ornament
\newcommand{\ornament}{
    \nointerlineskip
    \vspace{1.5\baselineskip}
    \hspace{\fill}
    {
        \resizebox{0.5\linewidth}{3.8ex}
        {
            \pgfornament[color = black]{87}
        }
    }
    \hspace{\fill}
    \par\nointerlineskip
    \vspace{1.5\baselineskip}
}

% This makes only sections and above have section numbers
% I don't like numbered subsections.
\setcounter{secnumdepth}{1}
\newenvironment{sidenote}
{
    \begin{center}
    \begin{tcolorbox}[colback=yellow!10!white,colframe=blue!75!black,width=350px]
}
{
    \end{tcolorbox}
    \end{center}
}

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


%%%%%%%%%%%%
% Commands %
%%%%%%%%%%%%

% For a horizontal rule, like in HTML
% \hr
\newcommand\hr{\par\vspace{-.5\ht\strutbox}\noindent\hrulefill\par}
\newcommand{\shorthr}{\vspace{0.2in}\rule{0.75in}{0.5px}\vspace{0.1in}}


% -------------------------------
% Linear Algebra shortcut stuff
% -------------------------------
% used a shitton in linear algebra
% \R gets you the fancy real numbers R
\newcommand{\R}{\textrm{I\!R}}
\newcommand{\Rn}{\R^n}
% Also \Poly for set of all polynomials
\newcommand{\Poly}{\textrm{I\!P}}
% Words in math, like rank A or Span{...}.
% \rank A = \text{rank } A
\newcommand{\Span}[1]{\text{Span}\left\{ #1 \right\}}
\newcommand{\rank}{\text{rank }}
\newcommand{\nullity}{\text{nullity }}
\newcommand{\Col}{\text{Col }}
\newcommand{\Row}{\text{Row }}
\newcommand{\Nul}{\text{Nul }}

% A set of vectors from 1, .., n
% {b_1,···,b_n}, with vector arrows
% Example
%   $B = \nvectors{b}$
\newcommand{\nvectors}[1]{ \left\{ \vec{#1_1}, \cdots, \vec{#1_n} \right\} }

