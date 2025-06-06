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

(setq twilio-account-sid
      (format "%s"
              (read-value-from-file
               (expand-file-name "~/.ssh/twilio-account-sid.txt"))))
(setq twilio-api-key
      (format "%s"
              (read-value-from-file
               (expand-file-name
                "~/.ssh/twilio-api-key.txt"))))
(setq twilio-auth-token
      (format "%s"
              (read-value-from-file
               (expand-file-name
                "~/.ssh/twilio-auth-token.txt"))))

(setq mcp-hub-servers
      `(("firebase" .
         (:command
          "npx"
          :args
          ("-y"
           "firebase-tools@latest"
           "experimental:mcp")))
        ("twilio" .
         (:command
          "npx"
          :args
          ("-y"
           "@twilio-alpha/mcp"
           (concat twilio-account-sid "/" twilio-api-key ":" twilio-auth-token))))
        ("filesystem" .
         (:command
          "npx"
          :args
          ("-y"
           "@modelcontextprotocol/server-filesystem"
           (default-directory))))
        ("fetch" . (:command "uvx" :args ("mcp-server-fetch")))))


(add-hook 'after-init-hook
          #'mcp-hub-start-all-server)

(provide 'init-mcp.el)
;;; init-mcp.el ends here
