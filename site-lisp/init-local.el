;;; init-local.el --- user customization over github.com/purcell/emacs.d -*- lexical-binding: t -*-
;;; Commentary:
;;; https://github.com/purcell/emacs.d/?tab=readme-ov-file#changing-themes-and-adding-your-own-customization
;;; Code:

(add-to-list 'load-path (expand-file-name "user-lisp" user-emacs-directory))
;; (require 'typo)
;; (require-package 'company)
;; (global-company-mode)
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
