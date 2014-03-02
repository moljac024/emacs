;; ==============================
;; Snippets
;; ==============================

(require-package 'yasnippet)
;; Enable yasnippet in programming modes
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))
