(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-local-mode)

;; Change cursor depending on state
;; (defun god-mode-update-cursor ()
;;   (setq cursor-type (if (or god-local-mode buffer-read-only)
;;                         'box
;;                       'bar)))

;; (add-hook 'god-mode-enabled-hook 'god-mode-update-cursor)
;; (add-hook 'god-mode-disabled-hook 'god-mode-update-cursor)
