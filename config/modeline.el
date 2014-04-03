;;===============================
;; Mode-line
;;===============================

(require-package 'smart-mode-line)

(use-package smart-mode-line
  :init
  (setq sml/theme 'dark)
  (sml/setup)
  (add-to-list 'sml/replacer-regexp-list '("^~/dev/lis/" ":LIS:"))
  (add-to-list 'sml/hidden-modes " yas")
  (add-to-list 'sml/hidden-modes " Undo-Tree")
  (add-to-list 'sml/hidden-modes " IK"))
