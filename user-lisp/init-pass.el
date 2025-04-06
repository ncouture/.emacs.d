;;; init-pass.el --- Uses password-store-menu a `pass' interface to Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;; Code

(require-package 'password-store-menu)

(setopt
 ;; Optionally set a custom key, default is C-c p
 password-store-menu-key  "C-c s"
 ;; Auto commit can be turned off, default is t
 password-store-menu-edit-auto-commit t)

;; Binds the key and enables password-store-menu-edit-mode
(password-store-menu-enable)

(provide 'init-pass)
;;; init-pass.el ends here.
