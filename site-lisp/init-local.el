;;; init-local.el --- user customization over github.com/purcell/emacs.d -*- lexical-binding: t -*-
;;; Commentary:
;;; https://github.com/purcell/emacs.d/?tab=readme-ov-file#changing-themes-and-adding-your-own-customization
;;; Code:

(add-to-list 'load-path (expand-file-name "user-lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "github.com/ncouture/org-timeblock.git" user-emacs-directory))
;; (require 'org-timeblock)
;; (org-timeblock)
(require-package 'ligature-pragmatapro)
(require-package 'company)
(require-package 'ivy)

(ligature-pragmatapro-setup)
(global-ligature-mode)
(global-company-mode)
(ivy-mode)

;;(require 'ivy-overlay)
;; (require 'typo)
;; (typo-global-mode)
;; (require 'init-pragmatapro)
(require 'init-gptel)
(require 'init-javascript-extras)
(require 'init-org-pdf-theme)
(require 'init-pass)
;;(require 'init-github-copilot)
;;(require 'init-python-tools)
;;(require 'init-spelling-tools)
;;(require 'init-keybindings)
;;(require 'init-utilities)
;;(require 'init-navigation)

(provide 'init-local)
;;; init-local.el ends here
