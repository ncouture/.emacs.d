;;; package --- Navigation
;;;
;;; Commentary:
;;;   Configure navigation related tools like ivy and smart-mode-line
;;;   with powerline-mode theme.
;;;
;;; Code:

;; (require-package 'flycheck)
;; (require-package 'company-mode)
;; (package-uninstall "dap-mode")
;; (require-package 'yasnippet)
;; (yas-global-mode)
;; (global-flycheck-mode)
;; (global-company-mode)
;; (dap-mode)
;; (add-hook 'dap-stopped-hook
;;          (lambda (arg) (call-interactively #'dap-hydra)))
;;(treemacs)


(require-package 'ivy)
(require 'ido)
;; (ivy-mode)
;; (require 'ace-flyspell)
;; you must require smart-line and a powerline theme for this to work:

(ido-everywhere)
(ivy-mode)
;; (require-package 'counsel)
;; (counsel-mode)
;; (setq rich-minority-mode 1)
;; (setq sml/shorten-directory 't)
;; (setq sml/shorten-modes 't)
;; (setq sml/theme 'powerline)
;; (setq sml/name-width 40)
;; (setq sml/mode-width `full)
;;(sml/setup)

(provide 'init-navigation)
;;; init-navigation ends here
