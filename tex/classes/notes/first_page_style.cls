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