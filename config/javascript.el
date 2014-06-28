;; ==============================
;; Javascript mode
;; ==============================

;; Use js-mode instead of outdated javascript-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("composer.lock" . js-mode))
;; Indent js code by 2 spaces
(add-hook 'js-mode-hook (lambda() (setq js-indent-level 2)))

;; Use js2-mode for js files
(require-package 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Indent javascript in js2-mode by 2 spaces
(add-hook 'js2-mode-hook (lambda() (setq-default js2-basic-offset 2)))
