;;===============================
;; Keybindings
;;===============================

;; ==============================
;; Remaps
;; ==============================

;; Exchange point and mark without activating the region
(define-key global-map
  [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

;; Commenting lines - do what i mean
(define-key global-map
  [remap comment-dwim] 'comment-dwim-line)

;; Make open line behave like vi o
(define-key global-map
  [remap open-line] 'open-next-line)

;; Remap dabbrev-expand to hippie-expand
;; (define-key global-map
;;   [remap dabbrev-expand] 'hippie-expand)

;; ==============================
;; Global keybinds
;; ==============================

;; Esc quits, not this triple esc nonsense
(define-key minibuffer-local-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-ns-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map [escape] 'keyboard-escape-quit)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Apropos instead of apropos-command with C-h a
(global-set-key (kbd "C-h a") 'apropos)
;; Make return indent new lines
(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "RET") 'default-indent-new-line)
;; (global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key [(shift return)] 'insert-empty-line)
;; Buffer-menu instead of list-buffers:
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;; Ibuffer instead of list-buffers:
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-x b") 'helm-buffers-list)
;; Function keys (F5-F9 unbound by default)
(global-set-key (kbd "<f2>") 'execute-extended-command)
;; Run current file
(global-set-key (kbd "<f9>") 'run-current-file)
;; Indent line according to previous one with M-RET
(global-set-key (kbd "<M-RET>") 'indent-new-comment-line)
;; Open notes
(global-set-key (kbd "C-c n") 'open-notes-org)
;; Open a bash terminal
(global-set-key (kbd "C-c t") '(lambda () (interactive) (ansi-term "/bin/bash")))

;; Get rid of `find-file-read-only' and replace it with something more useful
(global-set-key (kbd "C-x C-r") 'ido-recentf-open-fancy)
;; Open dired with "C-x C-d", instead of directory listing
(global-set-key (kbd "C-x C-d") 'dired)

;; Set and jump to mark
(global-set-key (kbd "C-`") 'push-mark-no-activate)
(global-set-key (kbd "M-`") 'jump-to-mark)

;; Open eshell
(global-set-key (kbd "C-c e") 'eshell)
(global-set-key (kbd "C-c s") 'eshell)
