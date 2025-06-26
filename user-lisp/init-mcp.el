;;; package --- Summary:
;;; Anthropic MCP Integrations
;;;
;;; Commentary:
;;;

(add-to-list 'load-path (expand-file-name "github.com/lizqwerscott/mcp.el/" user-emacs-directory))

(require 'mcp)
(require 'mcp-hub)

(defun read-value-from-file (file-path)
  "Read and return a value from FILE-PATH."
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    ;; Read the first Lisp expression from the buffer
    (read (current-buffer))))

;; (setq twilio-mcp-auth
;;       (format "%s"
;;               (read-value-from-file
;;                (expand-file-name
;;                 "~/.ssh/twilip-mcp.txt"))))

(setq mcp-hub-servers
      `(("firebase" . (:command "npx" :args ("-y" "firebase-tools@latest" "experimental:mcp")))))
(add-hook 'after-init-hook
          #'mcp-hub-start-all-server)

(provide 'init-mcp.el)
;;; init-mcp.el ends here
