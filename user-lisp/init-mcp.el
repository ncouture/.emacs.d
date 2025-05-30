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


(setq mcp-hub-servers
      `(("firebase" . (:command "npx" :args ("-y" "firebase-tools@latest" "experimental:mcp")))
        ("twilio" . (:command "npx" :args
                              ("-y"
                               "@twilio-alpha/mcp"
                               "AC59affb98762847119d271b39a457f5e0/SK8d3b5eff0c9e9045b3184bf330093978:CszcUTvgof7J1jLeNzZ7uLxszl4iuaI3"
                               ;; "--services"
                               ;; "twilio_accounts_v1")))
                               ("filesystem" . (:command "npx" :args ("-y" "@modelcontextprotocol/server-filesystem" "/home/strmvlt/git/reparationbeton.com/functions")))
                               ("fetch" . (:command "uvx" :args ("mcp-server-fetch"))))))))


(add-hook 'after-init-hook
          #'mcp-hub-start-all-server)

(provide 'init-mcp.el)
;;; init-mcp.el ends here
