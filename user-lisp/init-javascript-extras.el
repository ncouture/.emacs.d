;;; init-javascript-extras.el --- JS extras
;;; Commentary:
;;; Code:

;; (require-package 'lsp-mode)
;; (require-package 'lsp-tailwindcss)
(require-package 'vue-mode)

;; Company fuzzy completion
(when (and
       (maybe-require-package 'company)
       (maybe-require-package 'company-flx))
  (company-flx-mode +1))

;; js2-jsx-mode
;; (add-hook 'js2-jsx-mode-hook #'lsp-mode)
;; (add-hook 'js2-jsx-mode-hook #'js2-jsx-indent-line)

;; Vue configuration
(setq session-use-package t)
(setq vue-dedicated-modes '(js-mode js2-jsx-mode))

;; This never worked
;;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . envrc-allow))
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
;;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode-reparse))
(add-auto-mode 'vue-mode "\\.vue")
;; (add-auto-mode 'lsp-mode "\\.vue")
;; (add-auto-mode 'lsp-tailwindcss "\\.\\vue")
;; (add-auto-mode 'lsp-tailwindcss-rustywind "\\.vue")

;;; When mode is vue-mode set a before-save-hook to 'nil
;; (add-hook 'vue-mode-hook
;;           (lambda ()
;;             (setq before-save-hook 'lsp-tailwindcss-rustywind-before-save)))

;; (setq lsp-completion-default-behaviour :insert)
;; (setq lsp-completion-mode-hook '(lsp-tailwindcss-rustywind))

(provide 'init-javascript-extras)
;;; init-javascript-extras.el ends here
