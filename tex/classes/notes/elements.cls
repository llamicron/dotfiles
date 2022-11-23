% For a horizontal rule, like in HTML
% \hr
\newcommand\hr{\par\vspace{-.5\ht\strutbox}\noindent\hrulefill\par}
\newcommand{\shorthr}{\vspace{0.2in}\rule{0.75in}{0.5px}\vspace{0.1in}}

% Sidenote environment
\newenvironment{sidenote}
{
    \begin{center}
    \begin{tcolorbox}[colback=yellow!10!white,colframe=blue!75!black,width=350px]
}
{
    \end{tcolorbox}
    \end{center}
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