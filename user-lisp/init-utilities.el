;;; init-utilities.el --- Global Utilities
;;; Commentary:
;;; Code:
(require-package 'origami)
(global-origami-mode)
(global-set-key (kbd "<backtab>") 'origami-toggle-node)

;; treesit
(sanityinc/remap-ts-mode 'go-mode 'go-ts-mode 'go)

(provide 'init-utilities)
;;; init-utilities.el ends here
