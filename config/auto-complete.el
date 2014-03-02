;;===============================
;; Auto complete mode
;;===============================

(require-package 'auto-complete)
(require 'auto-complete)

;; Activate in programming modes
(add-hook 'prog-mode-hook 'auto-complete-mode)
