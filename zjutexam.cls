%% zjutexam.cls - 浙江工业大学考试试卷 LaTeX 模板类
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjutexam}[2025/06/14 Zhejiang University of Technology Exam Class]

\LoadClass[addpoints]{exam} % 基于 exam.cls

%% ---------------------- 基本宏包 ----------------------
\RequirePackage[noindent]{ctex}       % 中文支持
\RequirePackage{graphicx}             % 图片
\RequirePackage{amsmath, amssymb}     % 数学
\RequirePackage{booktabs}             % 三线表
\RequirePackage{xcolor}               % 颜色
\RequirePackage{zhnumber}             % 中文数字
\RequirePackage{tikz}                 % 绘图
\usetikzlibrary{arrows,shapes,trees}
\RequirePackage{listings}             % 代码高亮
\RequirePackage[linesnumbered,lined,commentsnumbered,ruled]{algorithm2e}  % 伪代码
\RequirePackage{setspace}
\RequirePackage{tabularx}             % 答案对齐

%% ---------------------- 字体设置 ----------------------
\setstretch{1.2}
\setCJKmainfont{PingFang SC}  % 主体中文字体（适配 macOS）
\setCJKsansfont{Heiti SC}
\setCJKmonofont{Menlo}

%% ---------------------- 中文替换 ----------------------
\renewcommand{\tablename}{表}
\renewcommand{\solutiontitle}{\noindent\textbf{答：}}
\renewcommand{\thequestion}{\zhnum{question}}
\renewcommand{\questionlabel}{\thequestion .}
\renewcommand{\thepartno}{\arabic{partno}}
\renewcommand{\partlabel}{\thepartno .}

%% ---------------------- 分值与样式 ----------------------
\pointname{ 分}
\pointformat{（\thepoints）}
\totalformat{ 共\totalpoints 分}
\setlength\linefillheight{.5in}

%% 判断题辅助命令
\newcommand{\tf}[1][{}]{%
  \fillin[#1][0.45in]%
}

%% 答案样式
\printanswers  
\colorsolutionboxes
\definecolor{SolutionBoxColor}{rgb}{1.0, 0.01, 0.24}
\SolutionEmphasis{\color{blue}\bfseries}
\CorrectChoiceEmphasis{\color{blue}\bfseries}
\newcommand{\solutionpoints}[1]{\textcolor{red}{#1\kern0.15em 分}}
\newcommand{\mypoints}[1]{\mbox{}\nobreak\hfill$\cdots\cdots$\solutionpoints{#1}\par\noindent\ignorespaces}

%% ---------------------- 元信息 ----------------------
\newcommand{\Subject}[1]{\def\ZJUT@Subject{#1}}
\newcommand{\Keywords}[1]{\def\ZJUT@Keywords{#1}}
\newcommand{\Year}[1]{\def\ZJUT@Year{#1}}
\newcommand{\Semester}[1]{\def\ZJUT@Semester{#1}}
\newcommand{\Course}[1]{\def\ZJUT@Course{#1}}
\newcommand{\Type}[1]{\def\ZJUT@Type{#1}}
\newcommand{\TotalPart}[1]{\setcounter{TotalPart}{#1}}

%% ---------------------- 试卷抬头 ----------------------
\newcommand{\makehead}{
  \begin{center}
    \parbox{\textwidth}{\centering \LARGE \bfseries 浙江工业大学 \ZJUT@Year 学年 \, 第~\ZJUT@Semester~学期 \\
    \underline{\quad \ZJUT@Course \quad} \, 试卷}\\
    \vspace{2em}
    \bf{任课教师} \hrulefill~  姓名 \hrulefill ~  学号 \hrulefill\mbox{}
    \vspace{2.5em}
    \vspace*{-2em}\\
    \hqword{题号:}
    \hpword{分值:}
    \htword{\textbf{总分}}
    \hsword{得分:}
    \cellwidth{4.2em}
    \gradetable[h][questions]% 得分表
  \end{center}
}

%% ====================== 统一参考答案格式 ======================
\newcommand{\solutionline}[3][4cm]{%
  \makebox[#1][l]{\underline{\makebox[#1][l]{\ttfamily\textbf{\color{blue}#2}}}}%
  \hfill \textcolor{red}{（#3 分）}%
}

%% ---------------------- 页眉页脚默认设置 ----------------------
\pagestyle{headandfoot}
\firstpageheadrule
\firstpageheader{浙江工业大学}{}{期末试卷}
\runningheader{浙江工业大学}{}{算法分析与设计-期末考试}
\runningheadrule
\firstpagefooter{}{第\thepage\ 页（共\numpages 页）}{}
\runningfooter{}{第\thepage\ 页（共\numpages 页）}{}

%% ---------------------- 注意事项框 ----------------------
\newcommand{\examnotice}{
  \vspace{1em}
  \fbox{%
    \parbox{\textwidth}{%
    \textbf{注意事项：}
    \begin{itemize}
      \item 本课程为\ZJUT@Type 考试。
      \item 在题目有下划线的空白处写下解答，\textbf{任何超出部分的解答都可能丢分}。
      \item 保持卷面整体干净、回答问题语言简练。
      \item 若无特别说明，所有题目的输入数据个数均为 $n$，对数以 2 为底，$c$ 表示常数。
    \end{itemize}
    }%
  }
  \vspace{1em}
}

%% ---------------------- 代码高亮默认配置 ----------------------
\lstset{
  basicstyle=\ttfamily\small,
  keywordstyle=\color{blue},
  commentstyle=\color{gray},
  stringstyle=\color{red},
  numbers=left,
  numberstyle=\tiny,
  stepnumber=1,
  numbersep=5pt,
  frame=single,
  language=C,
  breaklines=true,
  breakatwhitespace=false,
  showstringspaces=false,
  tabsize=2,
}

