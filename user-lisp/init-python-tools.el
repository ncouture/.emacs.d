;; ;;; package --- Summary
;; ;;; Commentary:
;; ;;;     Tools for python development.
;; ;;; Code:
;; (require-package 'elpy)
;; (require-package 'python-mode)
;; ;; (require-package 'python-docstring)
;; ;; (require-package 'blacken)
;; ;; (require-package 'py-isort)
;; (require-package 'pyenv-mode)
;; (require-package 'py-yapf)
;; (require-package 'jedi)
;; ;; (require-package 'pip-requirements)
;; (require-package 'company)
;; (require-package 'company-jedi)

;; ;; (add-to-list 'load-path "~/.pyenv/shims/jupyter")
;; ;; (require 'jupyter)

;; (add-hook 'after-init-hook 'global-company-mode)

;; (defun run-python-mode-functions ()
;;   "Execute a series of functions to set up Python development environment."
;;   (interactive)
;;   (pyenv-mode)
;;   (elpy-enable)
;;   (elpy-mode)
;;   ;; (jedi:install-python-jedi-dev)
;;   ;; (jedi:setup)
;;   ;; (jedi:start-dedicated-server)
;;   (jedi-mode)
;;   (company-jedi)
;;   ;; (blacken-mode)
;;   ;; (py-isort-before-save)
;;   ;; (python-docstring-mode)
;;   ;; (flycheck-mode)
;;   ;; (flyspell-prog-mode)
;;   ;; (pip-requirements-mode)
;;   ;; (highlight-indentation-mode)
;;   ;; (highlight-indentation-current-column-mode)
;;   ;; (py-yapd-enable-on-save)
;;   )

;; ;; (add-hook 'python-mode-hook 'run-python-mode-functions)
;; ;; (org-babel-do-load-languages
;; ;;  'org-babel-load-languages
;; ;;  '((emacs-lisp . t)
;; ;;    (julia . t)
;; ;;    (python . t)
;; ;;    (jupyter . t)))

(when (maybe-require-package 'flymake-ruff)
  (defun sanityinc/flymake-ruff-maybe-enable ()
    (when (executable-find "ruff")
      (flymake-ruff-load)))
  (add-hook 'python-mode-hook 'sanityinc/flymake-ruff-maybe-enable))

;;; TODO: save-buffer hooks before write files run isort etc.


(provide 'init-python-tools)
;;; init-python-tools.el
