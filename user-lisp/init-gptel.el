;;; init-gptel.el --- Mutl-LLM OpenAI Client -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;; Code:


(require 'gptel)

(defun read-value-from-file (file-path)
  "Read and return a value from a file."
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    ;; Read the first Lisp expression from the buffer
    (read (current-buffer))))

(setq this-api-key (format "%s" (read-value-from-file (expand-file-name "~/.ssh/anthropic.key"))))
(setq gptel-model 'claude-3-7-sonnet-20250219 gptel-backend
      (gptel-make-anthropic "Claude"
        :stream t
        :key this-api-key))

;; (use-package gptel-aibo
;;   :after (gptel)
;;   :config
;;   (define-key gptel-aibo-mode-map
;;               (kbd "C-c g A") #'gptel-aibo-apply-last-suggestions))

;; (require-package 'gptel-fn-complete)
;; (gptel-fn-complete)

;; Claude - setup Anthropic API Key
;; (gptel--make-anthropic
;;  :host "api.anthropic.com"
;;  :key this-api-key
;;  :stream t
;;  :models '("claude-3-7-sonnet-20250219"))
;; (defvar gptel-anthropic
;;   (gptel-make-anthropic "Claude" :key gptel-api-key :stream t))
;; (setq-default gptel-model 'claude-3-7-sonnet-20250219
;;               gptel-backend 'gptel-anthropic
;;               gptel-display-buffer-action '(pop-to-buffer-same-window))

(global-set-key (kbd "C-c RET") 'gptel-send)
(global-set-key (kbd "C-c /") 'gptel-fn-complete)
(provide 'init-gptel)
;;; init-gptel.el ends here.
