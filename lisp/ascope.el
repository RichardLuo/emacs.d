(defvar ascope-first-match-point nil)
(make-variable-buffer-local 'ascope-first-match-point)

(defun ascope-init ()
  "Initialize the ascope variables."
  (setq ascope-first-match-point nil))

(defun ascope-find-this-symbol (symbol)
  "Locate a symbol in source code."
  (interactive (ascope-interactive "Find this symbol: "))
  (setq query-command (concat "0" symbol "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Find this symbol: %s" symbol))
  (ascope-query query-command))

(defun ascope-find-global-definition (symbol)
  "Find a symbol's global definition."
  (interactive (ascope-interactive "Find this global definition: "))
  (setq query-command (concat "1" symbol "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Finding global definition: %s" symbol))
  (ascope-query query-command))

(defun ascope-find-called-functions (symbol)
  "Display functions called by a function."
  (interactive (ascope-interactive "Find functions called by this function: "))
  (setq query-command (concat "2" symbol "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Find functions called by this function: %s" symbol))
  (ascope-query query-command))

(defun ascope-find-functions-calling-this-function (symbol)
  "Display functions calling a function."
  (interactive (ascope-interactive "Find functions calling this function: "))
  (setq query-command (concat "3" symbol "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Find functions calling this function: %s" symbol))
  (ascope-query query-command))

(defun ascope-find-this-text-string (symbol)
  "Locate where a text string occurs."
  (interactive (ascope-interactive "Find this text string: "))
  (setq query-command (concat "4" symbol "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Find this text string: %s" symbol))
  (ascope-query query-command))

(defun ascope-find-egrep-pattern (pattern)
  "Locate an egrep pattern."
  (interactive (ascope-interactive "Find this egrep pattern: "))
  (setq query-command (concat "6" pattern "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Find this egrep pattern: %s" pattern))
  (ascope-query query-command))

(defun ascope-find-this-file (filename)
  "Locate a file."
  (interactive (ascope-interactive "Find this file: "))
  (setq query-command (concat "7" filename "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Find this file: %s" filename))
  (ascope-query query-command))

(defun ascope-find-files-including-file (filename)
  "Locate files #including a file."
  (interactive (ascope-interactive "Find files including this file: "))
  (setq query-command (concat "8" filename "\n"))
  (ring-insert ascope-marker-ring (point-marker))
  (setq ascope-action-message (format "Find files including this file: %s" filename))
  (ascope-query query-command))

(defun ascope-query (query-command)
  "Send QUERY-COMMAND to the ascope process."
  (with-current-buffer (get-buffer-create "*ascope*")
    (erase-buffer)
    (start-process "ascope" (current-buffer) "cscope" "-d" "-L" "-f" (ascope-get-cscope-out) "-q" "-l" query-command)
    (set-process-filter (get-process "ascope") 'ascope-filter))
  (with-current-buffer "*ascope*"
    (accept-process-output (get-process "ascope") 3)
    (if (looking-at ".*cannot open.*cscope\\.out.*")
        (progn
          (setq buf (get-buffer "*ascope*"))
          (if buf
              (kill-buffer buf))
          (message "ascope: no cscope.out file here"))
      (progn
        (ascope-wait-for-output)
        (message "ascope: load ok")))))

(provide 'ascope)
