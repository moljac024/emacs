;;===============================
;; Tabs and smart-tabs
;;===============================

(require 'cc-mode)

(defun he-tag-beg ()
  (let ((p
         (save-excursion
           (backward-word 1)
           (point))))
    p))

(defun tags-complete-tag (string predicate what)
  (save-excursion
    ;; If we need to ask for the tag table, allow that.
    (if (eq what t)
        (all-completions string (tags-completion-table) predicate)
      (try-completion string (tags-completion-table) predicate))))

(defun try-expand-tag (old)
  (unless  old
    (he-init-string (he-tag-beg) (point))
    (setq he-expand-list (sort
                          (all-completions he-search-string 'tags-complete-tag) 'string-lessp)))
  (while (and he-expand-list
              (he-string-member (car he-expand-list) he-tried-table))
    (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
        (when old (he-reset-string))
        ())
    (he-substitute-string (car he-expand-list))
    (setq he-expand-list (cdr he-expand-list))
    t))

(defun try-expand-tag-smart (arg)
  (if tags-completion-table
      (try-expand-tag arg)))

;; Hippie expand - really nice built-in autocompletion
;; Set completion functions for hippie expand:
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-complete-file-name
        ;; try-expand-tag-smart
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol))

;; (defun tab-noconflict ()
;;   (let ((command (key-binding [tab]))) ; remember command
;;     (local-unset-key [tab]) ; unset from (kbd "<tab>")
;;     (local-set-key (kbd "TAB") command))) ; bind to (kbd "TAB")
;; ;; Fix offending modes
;; (add-hook 'ruby-mode-hook 'tab-noconflict)
;; (add-hook 'markdown-mode-hook 'tab-noconflict)
;; (add-hook 'org-mode-hook 'tab-noconflict)
