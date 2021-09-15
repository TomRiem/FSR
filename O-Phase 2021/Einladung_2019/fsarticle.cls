\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fsarticle}
\RequirePackage{ifthen}

\newboolean{@german}
\setboolean{@german}{false}
\DeclareOption{german}{\setboolean{@german}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions

\LoadClass[a4paper]{article}
\newcommand{\englishnames}{%
 \newcommand{\ymailname}{\textsl{Your letter from}}
 \newcommand{\subjectname}{\textsl{Subject}}
 \newcommand{\telephonename}{Telephone}
 \newcommand{\germanname}{Germany}
 \newcommand{\mailname}{Mail Address}
 \newcommand{\telcode}{+49-371-531\,16200}
 \newcommand{\faxcode}{+49-371-531\,16209}
}
\newcommand{\germannames}{%
 \newcommand{\ymailname}{\textsl{Ihr Schreiben vom}}
 \newcommand{\subjectname}{\underline{Betreff}}
 \newcommand{\telephonename}{Telefon}
 \newcommand{\germanname}{\vspace{-8pt}}
 \newcommand{\mailname}{Anschrift}
 \newcommand{\telcode}{(0371)\,531\,16200}
 \newcommand{\faxcode}{(0371)\,531\,16209}
}
\ifthenelse{\boolean{@german}}%
  {\RequirePackage{german}\germannames}{\englishnames}

\newcommand{\@ymail}{}
\newcommand{\@subject}{}

\newcommand{\ymail}[1]{\renewcommand{\@ymail}{\ymailname: #1}}
\newcommand{\subject}[1]{\renewcommand{\@subject}{%
    \subjectname: #1}}
\newcommand{\email}{fsrmathe@tu-chemnitz.de}

\setlength{\textheight}{210mm}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}
\setlength{\headsep}{35pt}
\setlength{\textwidth}{160mm}
\setlength{\topmargin}{-80pt}
\setlength{\headheight}{20pt}

\newlength{\leftfield} \setlength{\leftfield}{110mm}
\newlength{\rightfield} \setlength{\rightfield}{50mm}

\DeclareFixedFont{\xiiisf}{OT1}{cmss}{m}{n}{17.28}
\DeclareFixedFont{\xsf}{OT1}{cmss}{m}{n}{12}
\DeclareFixedFont{\viiisf}{OT1}{cmss}{m}{n}{8}

\newsavebox{\FSR}
\newsavebox{\fsr}
\newsavebox{\fsrhead}
\newsavebox{\fsraddress}
\newsavebox{\fsrreturn}
\newsavebox{\fsrfoot}

\sbox{\FSR}{\parbox[t]{\leftfield}{\xiiisf Technische Universit\"at 
    Chemnitz\\[0.5ex]
    \xsf Fachschaftsrat Mathematik}}
\sbox{\fsraddress}{\parbox[t]{\rightfield}
    {\viiisf\baselineskip10pt Reichenhainer Stra{\ss}e 41/001\\
		09126 Chemnitz\\ \germanname}}
\sbox{\fsr}{\xsf Fachschaftsrat Mathematik}
\sbox{\fsrreturn}{\viiisf \underline{Technische Universit\"at Chemnitz,
   Fachschaftsrat Mathematik, 09107 Chemnitz}}
\sbox{\fsrhead}{\parbox{\textwidth}{\usebox{\FSR}%
   \raisebox{6pt}{\usebox{\fsraddress}}\\[8pt]\rule{\textwidth}{1pt}}}
\sbox{\fsrfoot}{\parbox{\textwidth}{%
  \rule{\textwidth}{0.6pt}\\[5pt]
  \viiisf\setlength{\baselineskip}{12pt}%
  \begin{tabular}[t]{@{}ll}
    \underline{\telephonename}&\telcode\\
    \underline{Telefax}&\faxcode\\
    \underline{E-Mail}&\email\\
    \underline{URL}&www.tu-chemnitz.de...\\
		&.../mathematik/fsrmathe\\
  \end{tabular}
  \hfill
  \begin{tabular}[t]{ll}
    \underline{Bank}&\\
%    Inhaber&Fachschaft Mathematik\\
    Institut&HypoVereinsbank\,Chemnitz\\
    BLZ&870\,200\,86\\
    Konto.-Nr.&385\,195\,377\\
   \end{tabular}\hfill
  \begin{tabular}[t]{l@{}}
   \underline{\mailname}\\
   Reichenhainer Str. 41/001\\
   09126 Chemnitz\\
  \end{tabular} }}


%\newcommand{\date}[1]{\def\@date{#1}}


\renewcommand{\ps@headings}
 {\setlength{\headheight}{41pt}%
  \renewcommand{\@oddhead}{\parbox{\textwidth}{%
     \usebox{\fsr}\hfill
     \slshape \@date\hfill
              \pagename{} \thepage\\
     \rule[3pt]{\textwidth}{1pt}}}
  \renewcommand{\@oddfoot}{}
  \renewcommand{\@evenhead}{\@oddhead}
  \renewcommand{\@evenfoot}{\@oddfoot}
}

\newcommand{\ps@firstpage}
 {\setlength{\headheight}{60pt}\setlength{\headsep}{80pt}%
  \renewcommand{\@oddhead}{\usebox{\fsrhead}}%
  \renewcommand{\@oddfoot}{\raisebox{-25pt}[0pt]{%
     \usebox{\fsrfoot}}}
  \renewcommand{\@evenhead}{}
  \renewcommand{\@evenfoot}{}}

\pagestyle{headings}

%\renewcommand{\@texttop}{}
