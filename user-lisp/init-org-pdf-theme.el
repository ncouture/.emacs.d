;;; init-org-pdf-theme.el --- Professional Org-Mode PDF Export Theme -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;;  On debian requirements can be installed as follows:
;;;    sudo apt-get update
;;;    sudo apt-get install texlive-full python3-pygments \
;;;                         texlive-base texlive-latex-recommended \
;;;                         texlive-latex-extra \
;;;                         texlive-fonts-recommended texlive-xetex
;;;
;;; Verify you have required fonts like so:
;;;
;;;   fonts=($(fc-list | grep "Source" | xargs -I"{}" dirname "{}"  | grep /usr/share/fonts | egrep 'source-serif|source-sans|source-code'-pro | sort -u | xargs -I"{}" basename "{}"))
;;;   [[ ${#fonts[@]} -ne 3]] && sudo apt-get install

;;; Code:

;; Professional Org-Mode PDF Export Theme
;; Add this to your Emacs configuration

;; Professional Org-Mode PDF Export Theme
;; Add this to your Emacs configuration

;; Professional Org-Mode PDF Export Theme for Debian Stable
;; Uses pdfLaTeX for maximum compatibility
;; Add this to your Emacs configuration

;; (require 'ox-latex)

;; ;; 1. Define our custom LaTeX class with all necessary packages
;; (add-to-list 'org-latex-classes
;;              '("org-modern"
;;                "\\documentclass[11pt,a4paper]{article}
;; \\usepackage[utf8]{inputenc}
;; \\usepackage[T1]{fontenc}
;; \\usepackage{graphicx}
;; \\usepackage{longtable}
;; \\usepackage{wrapfig}
;; \\usepackage{rotating}
;; \\usepackage[normalem]{ulem}
;; \\usepackage{amsmath}
;; \\usepackage{textcomp}
;; \\usepackage{amssymb}
;; \\usepackage{capt-of}
;; \\usepackage{hyperref}
;; \\usepackage{geometry}
;; \\usepackage{xcolor}
;; \\usepackage{fancyhdr}
;; \\usepackage{minted}
;; \\usepackage{titlesec}
;; \\usepackage{titling}
;; \\usepackage{booktabs}
;; \\usepackage{array}
;; \\usepackage{tabularx}
;; \\usepackage{colortbl}
;; \\usepackage{float}
;; \\usepackage{soul}
;; \\usepackage{microtype}
;; \\usepackage{mdframed}

;; % Font configuration - using standard fonts available in Debian stable
;; \\usepackage{lmodern}  % Latin Modern font family (improved Computer Modern)
;; % Alternatively, uncomment these for different font choices
;; % \\usepackage{libertine}  % Linux Libertine for serif
;; % \\usepackage{libertinuss}  % Linux Libertine Sans for sans-serif
;; % \\usepackage{inconsolata} % Inconsolata for monospace

;; % Page geometry
;; \\geometry{margin=1.0in}

;; % Define colors
;; \\definecolor{primarycolor}{RGB}{0, 103, 149}
;; \\definecolor{secondarycolor}{RGB}{70, 142, 175}
;; \\definecolor{accentcolor}{RGB}{255, 128, 0}
;; \\definecolor{lightgray}{RGB}{240, 240, 240}
;; \\definecolor{codebg}{RGB}{247, 247, 247}

;; % Header and footer styling
;; \\pagestyle{fancy}
;; \\fancyhf{}
;; \\lhead{\\textit{\\nouppercase{\\leftmark}}}
;; \\rhead{\\thepage}
;; \\lfoot{\\today}
;; \\rfoot{\\textsc{Author: \\theauthor}}
;; \\renewcommand{\\headrulewidth}{0.4pt}
;; \\renewcommand{\\footrulewidth}{0.4pt}

;; % Section formatting
;; \\titleformat*{\\section}{\\Large\\bfseries\\color{primarycolor}}
;; \\titleformat*{\\subsection}{\\large\\bfseries\\color{secondarycolor}}
;; \\titleformat*{\\subsubsection}{\\normalsize\\bfseries\\color{secondarycolor}}

;; % Hyperlink styling
;; \\hypersetup{
;;   colorlinks=true,
;;   linkcolor=primarycolor,
;;   filecolor=accentcolor,
;;   citecolor=secondarycolor,
;;   urlcolor=accentcolor,
;;   pdftitle={\\thetitle},
;;   pdfauthor={\\theauthor},
;;   pdfsubject={\\thesubject},
;;   pdfkeywords={org-mode, latex, pdf}
;; }

;; % Title page styling
;; \\pretitle{\\begin{center}\\LARGE\\color{primarycolor}}
;; \\posttitle{\\end{center}\\vskip 0.5em}
;; \\preauthor{\\begin{center}\\large\\color{secondarycolor}}
;; \\postauthor{\\end{center}}
;; \\predate{\\begin{center}\\large}
;; \\postdate{\\end{center}\\vskip 2em}

;; % Table styling
;; \\arrayrulecolor{primarycolor}
;; \\renewcommand{\\arraystretch}{1.2}

;; % Custom environments
;; \\newenvironment{note}{%
;;   \\begin{mdframed}[linecolor=secondarycolor,backgroundcolor=lightgray,linewidth=1pt]
;;   \\textbf{Note: }
;; }{%
;;   \\end{mdframed}
;; }

;; \\newenvironment{warning}{%
;;   \\begin{mdframed}[linecolor=accentcolor,backgroundcolor=lightgray,linewidth=1pt]
;;   \\textbf{Warning: }
;; }{%
;;   \\end{mdframed}
;; }

;; [NO-DEFAULT-PACKAGES]
;; [PACKAGES]
;; [EXTRA]"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; ;; 2. Configure code blocks with minted
;; (setq org-latex-listings 'minted)
;; (setq org-latex-minted-options
;;       '(("frame" "lines")
;;         ("framesep" "2mm")
;;         ("linenos" "")
;;         ("breaklines" "true")
;;         ("fontsize" "\\footnotesize")
;;         ("bgcolor" "codebg")))

;; ;; 3. Set up PDF processing with shell-escape for minted
;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; ;; 4. Enable booktabs for tables
;; (setq org-latex-tables-booktabs t)

;; ;; 5. Set org-modern as the default class
;; (setq org-latex-default-class "org-modern")

;; ;; 6. Custom export functions for convenience
;; (defun my-org-export-as-pdf ()
;;   "Export current org file as PDF with the professional theme."
;;   (interactive)
;;   (org-latex-export-to-pdf))

;; ;; 7. Add some key bindings
;; (global-set-key (kbd "C-c e p") 'my-org-export-as-pdf)

;; ;; 8. Configure which org export options to use by default
;; (setq org-export-with-smart-quotes t
;;       org-export-with-toc t
;;       org-export-with-author t
;;       org-export-with-date t
;;       org-export-with-title t
;;       org-export-with-sub-superscripts '{})

;; ;; 9. Configure org babel for code blocks
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . t)
;;    (python . t)
;;    (shell . t)
;;    (latex . t)))

;; ;; 10. Allow evaluation of code blocks without confirmation
;; (setq org-confirm-babel-evaluate nil)


;;;;; PRAGMATAPRO
;; Professional Org-Mode PDF Export Theme with PragmataPro Fonts
;; Uses XeLaTeX to access system fonts
;; Add this to your Emacs configuration

(require 'ox-latex)
(require 'org-plot)

;; 1. Define our custom LaTeX class with all necessary packages
(add-to-list 'org-latex-classes
             '("org-modern"
               "\\documentclass[11pt,a4paper]{article}
\\usepackage{fontspec}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{amssymb}
\\usepackage{capt-of}
\\usepackage{hyperref}
\\usepackage{geometry}
\\usepackage{xcolor}
\\usepackage{fancyhdr}
\\usepackage{minted}
\\usepackage{titlesec}
\\usepackage{titling}
\\usepackage{booktabs}
\\usepackage{array}
\\usepackage{tabularx}
\\usepackage{colortbl}
\\usepackage{float}
\\usepackage{soul}
\\usepackage{microtype}
\\usepackage{mdframed}

% Page geometry
\\geometry{margin=1.0in}

% Define colors
\\definecolor{primarycolor}{RGB}{0, 103, 149}
\\definecolor{secondarycolor}{RGB}{70, 142, 175}
\\definecolor{accentcolor}{RGB}{255, 128, 0}
\\definecolor{lightgray}{RGB}{240, 240, 240}
\\definecolor{codebg}{RGB}{247, 247, 247}

% Font configuration using PragmataPro fonts

\\setmainfont{PragmataProR_liga_0830.otf}[[
  Path = /home/strmvlt/.fonts/,
  Extension = .otf,
  UprightFont = PragmataProMonoLiga-Regular
  BoldFont = *-0830,
  ItalicFont = *-0830,
  LightFont = *-0830
]
\\setsansfont{PragmataProR_0830}[
  Path = /home/strmvlt/.fonts/,
  UprightFont = PragmataPro-Regular
  Extension = .otf
]
\\setmonofont{PragmataPro_Mono_R_liga}[
  Path = /home/strmvlt/.fonts/,
  UprightFont = PragmataProMonoLiga-Regular,
  Extension = .otf
]

% Header and footer styling
\\pagestyle{fancy}
\\fancyhf{}
\\lhead{\\textit{\\nouppercase{\\leftmark}}}
\\rhead{\\thepage}
\\lfoot{\\today}
\\rfoot{\\textsc{Author: \\theauthor}}
\\renewcommand{\\headrulewidth}{0.4pt}
\\renewcommand{\\footrulewidth}{0.4pt}

% Section formatting
\\titleformat*{\\section}{\\Large\\bfseries\\color{primarycolor}}
\\titleformat*{\\subsection}{\\large\\bfseries\\color{secondarycolor}}
\\titleformat*{\\subsubsection}{\\normalsize\\bfseries\\color{secondarycolor}}

% Hyperlink styling
\\hypersetup{
  colorlinks=true,
  linkcolor=primarycolor,
  filecolor=accentcolor,
  citecolor=secondarycolor,
  urlcolor=accentcolor,
  pdftitle={\\thetitle},
  pdfauthor={\\theauthor},
  pdfsubject={\\thesubject},
  pdfkeywords={org-mode, latex, pdf}
}

% Title page styling
\\pretitle{\\begin{center}\\LARGE\\color{primarycolor}}
\\posttitle{\\end{center}\\vskip 0.5em}
\\preauthor{\\begin{center}\\large\\color{secondarycolor}}
\\postauthor{\\end{center}}
\\predate{\\begin{center}\\large}
\\postdate{\\end{center}\\vskip 2em}

% Table styling
\\arrayrulecolor{primarycolor}
\\renewcommand{\\arraystretch}{1.2}

% Custom environments
\\newenvironment{note}{%
  \\begin{mdframed}[linecolor=secondarycolor,backgroundcolor=lightgray,linewidth=1pt]
  \\textbf{Note: }
}{%
  \\end{mdframed}
}

\\newenvironment{warning}{%
  \\begin{mdframed}[linecolor=accentcolor,backgroundcolor=lightgray,linewidth=1pt]
  \\textbf{Warning: }
}{%
  \\end{mdframed}
}

[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 2. Configure code blocks with minted
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
      '(("frame" "lines")
        ("framesep" "2mm")
        ("linenos" "")
        ("breaklines" "true")
        ("fontsize" "\\footnotesize")
        ("bgcolor" "codebg")))

;; 3. Set up PDF processing with shell-escape for minted using XeLaTeX
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; 4. Enable booktabs for tables
(setq org-latex-tables-booktabs t)

;; 5. Set org-modern as the default class
(setq org-latex-default-class "org-modern")

;; 6. Custom export functions for convenience
(defun my-org-export-as-pdf ()
  "Export current org file as PDF with the professional theme."
  (interactive)
  (org-latex-export-to-pdf))

;; 7. Add some key bindings
(global-set-key (kbd "C-c e p") 'my-org-export-as-pdf)

;; 8. Configure which org export options to use by default
(setq org-export-with-smart-quotes t
      org-export-with-toc t
      org-export-with-author t
      org-export-with-date t
      org-export-with-title t
      org-export-with-sub-superscripts '{})

;; 9. Configure org babel for code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (shell . t)
   (latex . t)))

;; 10. Allow evaluation of code blocks without confirmation
(setq org-confirm-babel-evaluate nil)

(provide 'init-org-pdf-theme)
;;; init-org-pdf-theme.el ends here.
