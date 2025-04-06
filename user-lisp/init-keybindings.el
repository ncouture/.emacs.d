;;; Package --- Custom keybindings
;;;
;;; Commentary:
;;;
;;; Code:

(require-package 'editorconfig)
(editorconfig-mode)
(global-set-key (kbd "M-z") 'avy-goto-char-timer)

(provide 'init-keybindings)
;;; init-keybindings.el ends here.
