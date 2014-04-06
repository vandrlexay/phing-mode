;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Snippets go here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-skeleton phing-skeleton-target
  "Create a template for build target"
  nil
  (indent-for-tab-command) (concat "<target name=\"" (skeleton-read "Target name: ") "\" depends=\"\">") _  "</target>\n")

(define-skeleton phing-skeleton-command
  "Create a template for shell command"
  nil
  (indent-for-tab-command) "<exec passthru=\"true\" command=\"" _ "\"/>\n"
)

(define-skeleton phing-skeleton-project
  "Create base schema for build.xml"
  nil
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
  "<!-- " (skeleton-read "Project description: ") " -->\n"
  "<project name=\"" (skeleton-read "Project name: ") "\" basedir=\".\" default=\"main\">\n"
  "    <target name=\"main\" depends=\"\">\n"
  "      <exec passthru=\"true\" command=\"echo Build done\"/>\n"
  "    </target>\n"
  "</project>\n"
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Internal functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun phing-escape-string ()
  "Escape all special characters in raw string to make it suitable for xml"
  (interactive)
  (let ((tmpstr (buffer-substring (mark) (point)))
        (newstr ""))
    (setq newstr (replace-regexp-in-string "'" "&apos;"  tmpstr))
    (setq newstr (replace-regexp-in-string "\"" "&quot;" newstr))
    (kill-region (mark) (point))
    (insert newstr)))

(defun phing-unescape-string ()
  "Convert escaped characters from xml-encoded data to readable string"
  (interactive)
  (let ((tmpstr (buffer-substring (mark) (point)))
        (newstr ""))
    (setq newstr (replace-regexp-in-string  "&apos;" "'"  tmpstr))
    (setq newstr (replace-regexp-in-string  "&quot;" "\"" newstr))
    (kill-region (mark) (point))
    (insert newstr)))



(define-derived-mode phing-mode nxml-mode
  (setq mode-name "Phing")

  (setq phing-imenu-regexps (list
    (list "Properties" "<property.*? name=\\\"\\(.*?\\)\\\"" 1)
    (list "Targets" "<target.*? name=\\\"\\(.*?\\)\\\"" 1)))

  (set (make-local-variable 'imenu-generic-expression) phing-imenu-regexps)

  (local-set-key (kbd "M-p x") 'phing-skeleton-project)
  (local-set-key (kbd "M-p t") 'phing-skeleton-target)
  (local-set-key (kbd "M-p c") 'phing-skeleton-command)
  )
