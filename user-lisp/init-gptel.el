;;; init-gptel.el --- Mutl-LLM OpenAI Client & Model Context Procotol -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;;  - https://github.com/lizqwerscott/mcp.el/blob/master/Readme.org
;;;  - https://modelcontextprotocol.io/introduction
;;; Code:
;;;

;; Installation

;; Install Emacs 30 or higher version
;; Add the following code to your configuration file ~/.emacs:

;; (add-to-list 'load-path "<path-to-mcp.el>")
;; (require 'mcp-hub)

;; Usage

;; Mcp hub

;; Configuring MCP Servers

;; (setq mcp-hub-servers
;;       '(("filesystem" . (:command "npx" :args ("-y" "@modelcontextprotocol/server-filesystem" "/home/lizqwer/MyProject/")))
;;         ("fetch" . (:command "uvx" :args ("mcp-server-fetch")))
;;         ("qdrant" . (:url "http://localhost:8000/sse"))
;;         ("graphilit" . (
;;                         :command "npx"
;;                         :args ("-y" "graphlit-mcp-server")
;;                         :env (
;;                               :GRAPHLIT_ORGANIZATION_ID "your-organization-id"
;;                               :GRAPHLIT_ENVIRONMENT_ID "your-environment-id"
;;                               :GRAPHLIT_JWT_SECRET "your-jwt-secret")))))

;; You can use mcp-hub-start-all-server to start all MCP servers, such as launching all MCP servers after starting Emacs.

;; (add-hook 'after-init-hook
;;           #'mcp-hub-start-all-server)
;; Managing MCP Servers
;; Use mcp-hub to launch the server management interface, which will automatically start all configured MCP servers.

;; mcp-hub
;; Keymap
;; key	function	description
;; l	mcp-hub-view-log	View server logs
;; s	mcp-hub-start-server	Start server under cursor
;; k	mcp-hub-close-server	Stop server under cursor
;; r	mcp-hub-restart-server	Restart server under cursor
;; S	mcp-hub-start-all-server	Start all configured servers
;; R	mcp-hub-restart-all-server	Restart all configured servers
;; K	mcp-hub-close-all-server	Stop all running servers
;; use with gptel
;; A function for registering all MCP tools.

;; (defun gptel-mcp-register-tool ()
;;   (interactive)
;;   (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
;;     (mapcar #'(lambda (tool)
;;                 (apply #'gptel-make-tool
;;                        tool))
;;             tools)))
;; Activate all MCP tools using gptel.

;; (defun gptel-mcp-use-tool ()
;;   (interactive)
;;   (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
;;     (mapcar #'(lambda (tool)
;;                 (let ((path (list (plist-get tool :category)
;;                                   (plist-get tool :name))))
;;                   (push (gptel-get-tool path)
;;                         gptel-tools)))
;;             tools)))
;; Request gptel to cease using all mcp tools.

;; (defun gptel-mcp-close-use-tool ()
;;   (interactive)
;;   (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
;;     (mapcar #'(lambda (tool)
;;                 (let ((path (list (plist-get tool :category)
;;                                   (plist-get tool :name))))
;;                   (setq gptel-tools
;;                         (cl-remove-if #'(lambda (tool)
;;                                           (equal path
;;                                                  (list (gptel-tool-category tool)
;;                                                        (gptel-tool-name tool))))
;;                                       gptel-tools))))
;;             tools)))
;; Example filesystem server.
;; Establish the connection first.
;; (mcp-connect-server "filesystem" :command "npx" :args '("-y" "@modelcontextprotocol/server-filesystem" "~/Downloads/")
;;                     :initial-callback
;;                     #'(lambda (connection)
;;                         (message "%s connection" (jsonrpc-name connection)))
;;                     :tools-callback
;;                     #'(lambda (connection tools)
;;                         (message "%s tools: %s" (jsonrpc-name connection) tools))
;;                     :prompts-callback
;;                     #'(lambda (connection prompts)
;;                         (message "%s prompts: %s" (jsonrpc-name connection) prompts))
;;                     :resources-callback
;;                     #'(lambda (connection resources)
;;                         (message "%s resources: %s" (jsonrpc-name connection) resources)))
;; Define the use of tools.
;; The current text is being tested using the gptel tool branch.Use mcp-make-text-tool to create standard tool call data (Discussions).It is recommended to create tools within the tools-callback or wait for the mcp connect server to complete.

;; (mcp-make-text-tool "filesystem" "write_file")
;; This will generate a data structure where the function is an auto-generated synchronous or asynchronous lambda function for accessing the MCP server.

;; (list :function #'(lambda (&rest args)
;;                     ;; Synchronous or asynchronous access to the MCP server's Lambda function.
;;                     )
;;       :name "write_file"
;;       :async nil
;;       :description "Create a new file or completely overwrite an existing file with new content. Use with caution as it will overwrite existing files without warning. Handles text content with proper encoding. Only works within allowed directories."
;;       :args ((:type "string" :name "path" :description "path")
;;              (:type "string" :name "content" :description "content"))
;;       :category "files")
;; Disconnect from the server.
;; (mcp-stop-server "filesystem")
;; Manual function call
;; Synchronize
;; (let ((connection (gethash "filesystem" mcp-server-connections)))
;;   (mcp-call-tool connection "write_file" '(:path "filename or file path" :content "the file content")))
;; Asynchronous
;; (let ((connection (gethash "filesystem" mcp-server-connections)))
;;   (mcp-async-call-tool connection
;;                        "write_file"
;;                        '(:path "filename or file path" :content "the file content")
;;                        #'(lambda (res)
;;                            ;; handle res
;;                            (mcp--parse-tool-call-result res))
;;                        #'(lambda (code message)
;;                            ;; handle error
;;                            (format "call %s tool error with %s: %s"
;;                                    tool-name
;;                                    code
;;                                    message))))
;; Manual get prompt
;; Since the filesystem lacks prompts, the everything server is used for demonstration.

;; Synchronize
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-get-prompt connection "complex_prompt" '(:temperature "1.0")))
;; Asynchronous
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-async-get-prompt connection
;;                         "complex_prompt"
;;                         '(:temperature "1.0")
;;                         #'(lambda (res)
;;                             (message "prompt: %s" res))
;;                         #'(lambda (code message)
;;                             (message "error call: %s, %s" code message))))
;; Manual get resources
;; Since the filesystem lacks resources, the everything server is used for demonstration.

;; Synchronize
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-read-resource connection "test://static/resource/1"))
;; Asynchronous
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-async-read-resource connection "test://static/resource/1"
;;                            #'(lambda (resource)
;;                                (message "res: %s" resource))))
;; Get resource templates
;; Since the filesystem lacks resources, the everything server is used for demonstration.

;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-async-list-resource-templates connection
;;                                      #'(lambda (connection templates)
;;                                          (message "%s" templates))))

(defun read-value-from-file (file-path)
  "Read and return a value from FILE-PATH."
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    ;; Read the first Lisp expression from the buffer
    (read (current-buffer))))
(setq anthropic-api-key (format "%s" (read-value-from-file (expand-file-name "~/.ssh/anthropic.key"))))
(setq gptel-api-key anthropic-api-key)

(require-package 'gptel)
(require 'gptel)

;; (add-to-list 'load-path (expand-file-name "github.com/lizqwerscott/mcp.el/" user-emacs-directory))
;; (require 'mcp-hub)

;; After receiving tool results, carefully reflect on their quality and determine optimal next steps before proceeding. Use your thinking to plan and iterate based on this new information, and then take the best next action.



(setq gptel-model 'claude-sonnet-4-20250514 gptel-backend
      (gptel-make-anthropic "Claude"
        :stream t
        :key anthropic-api-key))



(require-package 'gptel-aibo)
(use-package gptel-aibo
  :after (prog-mode flycheck)
  :config
  (define-key prog-mode-map (kbd "C-i") #'gptel-aibo-summon))

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
