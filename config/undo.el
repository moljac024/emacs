;;===============================
;; Undo
;;===============================

;; Undo tree
(require-package 'undo-tree)
(global-undo-tree-mode t)

(global-set-key (kbd "C-c u") 'undo-tree-visualize)
