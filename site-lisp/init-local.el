;;; init-local.el --- user customization over github.com/purcell/emacs.d -*- lexical-binding: t -*-
;;; Commentary:
;;; https://github.com/purcell/emacs.d/?tab=readme-ov-file#changing-themes-and-adding-your-own-customization
;;; Code:
(with-eval-after-load 'projectile
  ;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-commander))

(require-package 'ef-themes)
(require 'ef-themes)
(load-theme 'ef-duo-dark)

(add-to-list 'load-path (expand-file-name "user-lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "github.com/ncouture/org-timeblock.git" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "github.com/lizqwerscott/mcp.el" user-emacs-directory))
;; (require 'org-timeblock)
;; (org-timeblock)
(require-package 'ligature-pragmatapro)

(require-package 'ivy)
(require-package 'smex)
(ligature-pragmatapro-setup)
(global-ligature-mode)
(global-company-mode)
(company-complete)
(company-css 't)
;; (ivy-mode)
;; (ivy-overlay)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Optional: bind old M-x as fallback
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; (require 'init-pragmatapro);;;
(require 'init-gptel)
(require 'init-javascript-extras)
(require 'init-org-pdf-theme)
(require 'init-pass)
(require 'init-utilities)


;;(require 'init-github-copilot)
;;(require 'init-python-tools)
;;(require 'init-spelling-tools)
;;(require 'init-keybindings)
;;(require 'init-utilities)
;;(require 'init-navigation)
;; used by nikola
(require-package 'htmlize)
(require 'htmlize)

(provide 'init-local)
;;; init-local.el ends here
