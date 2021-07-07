%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classe de documento LATEX para confecção de relatórios em geral.           %%
%% Inspirado no ic.cls do curso de Ciência da computação da Universidade      %%
%% Federal de Alagoas.                                                        %%
%%                                                                            %%
%% Autores:                                                                   %%
%%       Augusto Ícaro - contact@augustoicaro.com                             %%
%%                                                                            %%
%% Data: 26 de junho de 2014                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\NeedsTeXFormat{LaTeX2e}
   \ProvidesClass{myreport}[2014/06/26 v1.0 Modelo para relatorios gerais]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definição de extensão da classe REPORT - Papel A4, FONTE 12pt              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,12pt]{report} %210 mm X 294 mm
%%------------------------------------------------------------------------------
%% Habilita a utilização de arroba
%%------------------------------------------------------------------------------
\makeatletter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      LISTA DE PACOTES REQUERIDOS PARA A UTILIZAÇÃO DESTA CLASSE            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc} % Definição da codificação das fontes como T1
\RequirePackage[brazil,portuguese]{babel} % Definição para uso dos caracteres acentuados
\RequirePackage[utf8]{inputenc} % Codificação dos caracteres utilizada
\RequirePackage[a4paper]{geometry} % Para ajustar o papel
\RequirePackage{float} % Pacote necessário para modificação dos capitulos
\RequirePackage{titlesec, blindtext} % Permite modificar a forma dos capitulos de forma simples
\RequirePackage{setspace} % Definição dos espaçamemtos entre linhas
\RequirePackage[titletoc]{appendix} % Criação do ambiente de apêndices
\RequirePackage{calc} % Aceitação de notação infixa
\RequirePackage{fancyhdr} % Personalização de cabeçalhos e rodapés
\RequirePackage{listings} % Inclusão de código fonte de diversas linguagens
\RequirePackage{listingsutf8}
\RequirePackage{makecell} % Criar celulas em tabelas que permite quebra de linha
\RequirePackage{pslatex} % Utilização de fontes PostScript Tipo 1
% \RequirePackage{natbib} % Estilo das referências
\RequirePackage{url} % Para lidar com URLs
\RequirePackage{hyperref} % Para fazer referência
\RequirePackage{indentfirst} % Sempre identa a primeira linha
\RequirePackage{doc} % Contém a definição da logomarca do BibTex
\RequirePackage{color,colortbl, xcolor} % Permite "pintar" as tabelas
\RequirePackage[active]{srcltx} % Busca inversa do dvi para o tex
\RequirePackage{ifthen} % Utilização de condicionais em latex
\RequirePackage{tocloft} % Utilização para mudança da pontuação do sumário
\RequirePackage{caption}
\RequirePackage{subimages} % Melhor exibição de imagens

\RequirePackage{amssymb,amsmath,amsthm,amsfonts,amstext} %
\RequirePackage{amscd} %
%\RequirePackage{undertilde} % Utilização de caracteres com til em baixo
\RequirePackage{rotating}

\RequirePackage{fontawesome}
\RequirePackage{fourier}
\RequirePackage[euler-digits]{eulervm}
\RequirePackage{eucal} 
\RequirePackage{ae}
\RequirePackage{courier}
\RequirePackage{lettrine} %

\RequirePackage{tikz} % Pacote para desenhos (fig:diagrama)
\RequirePackage{bm} % Pacote para criação do modelo de RSsF (fig:model_rssf)
\RequirePackage{pdfcomment} % Comentário do Abstract
\RequirePackage{fancybox}
\RequirePackage{multicol}

\RequirePackage[ruled,chapter]{algorithm}
\RequirePackage{algpseudocode}

\RequirePackage[brazilian,hyperpageref]{backref}%
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
  \ifcase #1 %
    Nenhuma citação no texto.%
  \or
    Citado na página #2.%
  \else
    Citado #1 vezes nas páginas #2.%
  \fi%
}%

\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de Algoritmos}
\newenvironment{myequation}[2]
{\begin{equation}\label{#1}\addcontentsline{loe}{table}{\theequation~ #2}}
{\end{equation}}

\newcommand{\mequation}[3]{
\begin{equation}\label{#1}\addcontentsline{loe}{table}{\theequation~ #2}
#3
\end{equation}}

\renewcommand\lstlistingname{Lista de Códigos}
\renewcommand\lstlistlistingname{Lista de Códigos}
%%------------------------------------------------------------------------------
%% Sumário
%%------------------------------------------------------------------------------

\renewcommand{\cfttoctitlefont}{\large\bfseries} %!some command to make the heading huge and bold
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % for parts
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % for chapters
%\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % for sections, if you really want! (It is default in report and book class (So you may not need it).

%%------------------------------------------------------------------------------
%% Fontes
%%------------------------------------------------------------------------------
\definecolor{light_gray}{gray}{0.8}
\definecolor{Red}{rgb}{0.5,0,0}
\definecolor{Blue}{rgb}{0,0,0.5}

%%------------------------------------------------------------------------------
%% Redefinindo capítulo
%%------------------------------------------------------------------------------
\newcommand{\hsp}{\hspace{20pt}}
\def\@makechapterhead#1{%
  %%%%\vspace*{50\p@}% %%% removed!
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \thechapter\hsp\textcolor[cmyk]{0.43, 0.35, 0.35,0.01}{|}\hsp #1
        \par\nobreak
        \vskip 20\p@
  }}

%%------------------------------------------------------------------------------
%% Opções do pacote lettrine
%%------------------------------------------------------------------------------
\setcounter{DefaultLines}{3}
% \renewcommand{\DefaultLoversize}{0}
% \renewcommand{\DefaultLraise}{0.1}
% \setlength{\DefaultNindent}{0em}
% \setlength{\DefaultSlope}{-.5em}


% Comentário do abstract
\newcommand{\comAbstract}[3]{
\pdfmarkupcomment[color=white,author=#2,markup=Squiggly]{#1}{#3}
}
\newcommand{\doi}[1]{\textbf{DOI}~{\href{http://dx.doi.org/#1}{\color{Blue}#1}}}


% Resumo do capítulo
\newcommand{\resumocap}[1]{
\vfill
% \singlespacing
\begin{center}
\setlength\fboxsep{0.5pt}
\setlength\fboxrule{2pt}
 \doublebox{\colorbox{light_gray}{\parbox{.9\linewidth}{
#1
}}}
\end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 DEFINIÇÃO DO LAYOUT DO DOCUMENTO                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%------------------------------------------------------------------------------
%%  TAMANHOS VERTICAIS - COPIADO DO ESTILO PADRÃO DA ABNT - Pacote abntex.cls
%%------------------------------------------------------------------------------
% A distancia entre o topo do cabeçalho e o topo do texto é de 1cm, 
% isto é, 1cm=\headheight+\headsep
% ...mas, nós consideramos a profundidade do cabeçallho, adicionando 2mm.
\setlength{\headsep}{1.2cm-\headheight}
% A distância entre a borda do papel e o número deve ser de 2.5cm
% 2.5cm=\topmargin+\voffset+1in
\setlength{\topmargin}{2.5cm-1in-\voffset}
% A borda inferior deve ser de 2.5cm
% \paperheight=\topmargin+\voffset+1in+\headheight+\headsep+\textheight+2cm
\setlength{\textheight}%
{\paperheight-\topmargin-\voffset-1in-\headheight-\headsep-2.5cm}

%%------------------------------------------------------------------------------
%% TAMANHOS HORIZONTAIS - COPIADO DO ESTILO PADRÃO DA ABNT - Pacote abntex.cls
%%------------------------------------------------------------------------------
% A margem esquerda é de 3cm e a direita é igual a 2cm.
\setlength{\oddsidemargin}{3cm-\hoffset-1in}
% para compatibilidade com impressão frente e verso, o tamanho das margens 
%deve ser alterado
\setlength{\evensidemargin}{2cm-\hoffset-1in}
% \paperwidth=\textwidth+\oddsidemargin+\hoffset+1in+2cm
\setlength{\textwidth}{\paperwidth-\oddsidemargin-\hoffset-1in-2cm}

%%------------------------------------------------------------------------------
%% Define o cabeçalho das páginas
%%------------------------------------------------------------------------------
% Limpa qualquer configuração anterior
\fancyhf{}

% Define a aparição do nome da seção no cabeçalho(esquerda)
\lhead{\rightmark} 

% Define a aparição do número da página no cabeçalho(direita)
\rhead{\thepage} % Número da página

% Define a largura da barra
\renewcommand{\headrulewidth}{0.6pt} 

% Define a altura do cabeçalho
\addtolength{\headheight}{3.05pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                           DEFINIÇÃO DOS COMANDOS                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%------------------------------------------------------------------------------
%% Definição do comando CAPA
%%------------------------------------------------------------------------------
\newcommand{\capa}{%
  \thispagestyle{empty}%
  \hspace{-1.8cm}
  \begin{minipage}{7in}
    \centering
    \raisebox{-0.5\height}{\includegraphics[scale=.1]{ufal}}
  \end{minipage}
  \begin{center} % Alinhamento centralizado
    \vspace*{4cm} \large \textbf{Relatório de Estágio Curricular em\\\@autorCurso}\\%
    \vspace*{4cm}%
    \large \@autorNome \\ \normalsize \texttt{\@autorEmail}\\%
    \normalsize \vfill \@cidade\\\@ano%
  \end{center}%
  \renewcommand{\thepage}{\roman{page}} \setcounter{page}{0}%
  \normalsize%
}%

%%------------------------------------------------------------------------------
%% Definição do comando FOLHA DE ROSTO
%%------------------------------------------------------------------------------
\newcommand{\folhaDeRosto}{
    \newpage%
    \thispagestyle{empty}%
    \hspace{-1.8cm}
    \begin{minipage}{7in}
    \centering
    \raisebox{-0.5\height}{\includegraphics[scale=.1]{ufal}}
    \end{minipage}
    \begin{center} % Alinhamento centralizado
    \vspace*{1cm} \large \textbf{Relatório de Estágio Curricular em\\\@autorCurso}\\%
    \vspace*{1cm} \large \textbf{Dados do Estagiário}\\%
   \begin{flushleft}
   \normalsize
    Nome: \@autorNome\\
    Registro Acadêmico: \@autorMatricula\\
    Curso e Período: \@autorCurso\ \@autorPeriodo\ período\\
    \end{flushleft}
    \vspace*{1cm} \large \textbf{Dados do Local de Estágio}\\%
    \begin{flushleft}
    \normalsize
    Empresa: \@empresaNome\\
    Supervisor: \@empresaSupervisor\\
    N° de registro: \@empresaRegistro\\
    \end{flushleft}
    \vspace*{1cm} \large \textbf{Período de Estágio}\\%
    \begin{flushleft}
    \normalsize
    Início: \@estagioInicio\hspace*{3cm} Término: \@estagioFim\\
    Jornada de trabalho: \@estagioSemanal\ horas semanais\\
    Total de horas: \@estagioTotal\ horas em \@estagioDescritivo\\
    \end{flushleft}
    \normalsize \vfill \@cidade\\\@ano%
    \end{center}%
    \renewcommand{\thepage}{\roman{page}} \setcounter{page}{0}%
    \normalsize%
}%

%%------------------------------------------------------------------------------
%% Definição do comando APROVACAO
%%------------------------------------------------------------------------------

%%------------------------------------------------------------------------------
%% Contador de assinaturas
%%------------------------------------------------------------------------------
\newcounter{numeroDeAssinaturas}
\setcounter{numeroDeAssinaturas}{2}

%%------------------------------------------------------------------------------
%% Definição do comando INICIO para formatação de páginas
%%------------------------------------------------------------------------------
\newcommand{\inicio}{%
    \newpage%
    %Números no estilo arábico
    \renewcommand{\thepage}{\arabic{page}}%
    %Contador de página = 1
    \setcounter{page}{1}%
    %Espaçamento 1,5
    \onehalfspacing%
}%

%%------------------------------------------------------------------------------
%% Definição do comando AUTOR
%%------------------------------------------------------------------------------
\newcommand{\@autorNome}{}
\newcommand{\@autorEmail}{}
\newcommand{\@autorMatricula}{}
\newcommand{\@autorCurso}{}
\newcommand{\@autorPeriodo}{}
\newcommand{\autor}[5]{
    \renewcommand{\@autorNome}{#1}
    \renewcommand{\@autorEmail}{#2}
    \renewcommand{\@autorMatricula}{#3}
    \renewcommand{\@autorCurso}{#4}
    \renewcommand{\@autorPeriodo}{#5}
}%

%%------------------------------------------------------------------------------
%% Definição do comando EMPRESA
%%------------------------------------------------------------------------------
\newcommand{\@empresaNome}{}
\newcommand{\@empresaSupervisor}{}
\newcommand{\@empresaRegistro}{}
\newcommand{\empresa}[3]{
    \renewcommand{\@empresaNome}{#1}
    \renewcommand{\@empresaSupervisor}{#2}
    \renewcommand{\@empresaRegistro}{#3}
}%

%%------------------------------------------------------------------------------
%% Definição do comando ESTAGIO
%%------------------------------------------------------------------------------
\newcommand{\@estagioInicio}{}
\newcommand{\@estagioFim}{}
\newcommand{\@estagioSemanal}{}
\newcommand{\@estagioTotal}{}
\newcommand{\@estagioDescritivo}{}
\newcommand{\estagio}[5]{
    \renewcommand{\@estagioInicio}{#1}
    \renewcommand{\@estagioFim}{#2}
    \renewcommand{\@estagioSemanal}{#3}
    \renewcommand{\@estagioTotal}{#4}
    \renewcommand{\@estagioDescritivo}{#5}
}%

%%------------------------------------------------------------------------------
%% Definição do comando DATA
%%------------------------------------------------------------------------------
\newcommand{\@ano}{}
\newcommand{\ano}[1]{
    \renewcommand{\@ano}{#1}%
}%Fim de DATA

%%------------------------------------------------------------------------------
%% Definição do comando CIDADE
%%------------------------------------------------------------------------------
\newcommand{\@cidade}{}
\newcommand{\cidade}[1]{
    \renewcommand{\@cidade}{#1}%
}%Fim de CIDADE

%%------------------------------------------------------------------------------
%% Definição do comando DESCRICAO
%%------------------------------------------------------------------------------
\newcommand{\@descricao}{}
\newcommand{\descricao}[1]{
    \renewcommand{\@descricao}{#1}
}%Fim de DESCRICAO

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       DEFINIÇÃO DE AMBIENTES                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%------------------------------------------------------------------------------
%% Definição do ambiente RESUMO
%%------------------------------------------------------------------------------
\newenvironment{resumo}{
    \onehalfspacing
    \chapter*{\centering Resumo}
}{}

%%------------------------------------------------------------------------------
%% Redefinição do ambiente ABSTRACT
%%------------------------------------------------------------------------------
\renewenvironment{abstract}{
    \onehalfspacing
    \chapter*{\centering Abstract}
}{}

%%------------------------------------------------------------------------------
%% Definição do ambiente AGRADECIMENTOS
%%------------------------------------------------------------------------------
\newenvironment{agradecimentos}{
    \onehalfspacing
    \chapter*{\centering Agradecimentos}
}{}

%%------------------------------------------------------------------------------
%% Definição do ambiente CODIGO
%%------------------------------------------------------------------------------

\lstset{
	language=R,
	basicstyle=\footnotesize\ttfamily, % Standardschrift
   	numbers=left,               % Ort der Zeilennummern
    numberstyle=\tiny,          % Stil der Zeilennummern
    stepnumber=1,               % Abstand zwischen den Zeilennummern
    numbersep=5pt,              % Abstand der Nummern zum Text
    tabsize=2,                  % Groesse von Tabs
    extendedchars=true,         %
    breaklines=true,            % Zeilen werden Umgebrochen
    keywordstyle=\color{red},
    frame=b,
    inputencoding=utf8/latin1,
    stringstyle=\color{gray}\ttfamily, % Farbe der String
    showspaces=false,           % Leerzeichen anzeigen ?
    showtabs=false,             % Tabs anzeigen ?
    xleftmargin=17pt,
    framexleftmargin=17pt,
    framexrightmargin=5pt,
    framexbottommargin=4pt,
    %backgroundcolor=\color{lightgray},
    showstringspaces=false      % Leerzeichen in Strings anzeigen ?
}
\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{listing}{\colorbox[cmyk]{0.43, 0.35, 0.35,0.01}{\parbox{\textwidth}{\hspace{15pt}#1#2#3}}}
\captionsetup[lstlisting]{format=listing,labelfont=white,textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 CONFIGURAÇÕES PARA O CORPO DO DOCUMENTO                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
    \normalsize
    %% Configura para utilizar o cabeçalho e rodapé definidos anteriormente.    
    \pagestyle{fancy}
    %% Define o módulo de citação abreviado(Harvard)
    %\citationmode{abbr}
    %% Define o estilo bibligráfico agsm(Harvard)
    %\bibliographystyle{agsm}
    \bibliographystyle{abnt-alf}
}

%%------------------------------------------------------------------------------
%% Desabilita a utilização de arroba
%%------------------------------------------------------------------------------
\makeatother
