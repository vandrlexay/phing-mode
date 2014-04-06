(defun phing-escape-string ()
  (interactive)
  (let ((tmpstr (buffer-substring (mark) (point)))
        (newstr ""))
    (setq newstr (replace-regexp-in-string "'" "&apos;"  tmpstr))
    (setq newstr (replace-regexp-in-string "\"" "&quot;" newstr))
    (kill-region (mark) (point))
    (insert newstr)))

(defun phing-unescape-string ()
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
  )
