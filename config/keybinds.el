;;===============================
;; Keybindings
;;===============================

;; ==============================
;; Remaps
;; ==============================

;; Exchange point and mark without activating the region
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

;; Commenting lines - do what i mean
(define-key global-map [remap comment-dwim] 'comment-dwim-line)
;; Make open line behave like vi o
(define-key global-map [remap open-line] 'open-next-line)
;; Remap dabbrev-expand to hippie-expand
;; (define-key global-map [remap dabbrev-expand] 'hippie-expand)

;; ==============================
;; Clear bindings
;; ==============================

;; Remove M-number bindings (default is universal argument)
(global-unset-key (kbd "M-1"))
(global-unset-key (kbd "M-2"))
(global-unset-key (kbd "M-3"))
(global-unset-key (kbd "M-4"))
(global-unset-key (kbd "M-5"))
(global-unset-key (kbd "M-6"))
(global-unset-key (kbd "M-7"))
(global-unset-key (kbd "M-8"))
(global-unset-key (kbd "M-9"))
(global-unset-key (kbd "M-0"))

;; ==============================
;; Global keybinds
;; ==============================

;; Esc quits, not this triple esc nonsense
(define-key minibuffer-local-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-ns-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map [escape] 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map [escape] 'keyboard-escape-quit)

;; Esc quits, not this triple esc nonsense
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Apropos instead of apropos-command with C-h a
(global-set-key (kbd "C-h a") 'apropos)
;; Make return indent new lines
(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "RET") 'default-indent-new-line)
;; (global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key [(shift return)] 'insert-empty-line)
;; Buffer-menu instead of list-buffers:
;; (global-set-key (kbd "C-x C-b") 'buffer-menu)
;; Ibuffer instead of list-buffers:
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Function keys (F5-F9 unbound by default)
;; (global-set-key (kbd "<f2>") 'execute-extended-command)
(global-set-key (kbd "<f2>") 'smex)
(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "<f9>") 'run-current-file)
;; Toggle whitespace mode
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; Run current file
(global-set-key (kbd "C-c r") 'run-current-file)
;; Indent line according to previous one with M-RET
(global-set-key (kbd "<M-RET>") 'indent-new-comment-line)
;; Enter hex edit mode with C-c C-h
(global-set-key (kbd "C-c C-h") 'hexl-mode)
;; Open music directory in dired
(global-set-key (kbd "C-c m d") 'dired-open-music-dir)
;; Change between PHP and HTML mode
;; (global-set-key (kbd "C-c w") 'toggle-php-html-mode)
;; Open a shell
(global-set-key (kbd "C-c s") 'eshell)
;; Open notes
(global-set-key (kbd "C-c n") 'open-notes-org)
;; Open a bash terminal
(global-set-key (kbd "C-c t") '(lambda () (interactive) (ansi-term "/bin/bash")))

;; (global-set-key (kbd "C-kp-6") 'enlarge-window-horizontally)
;; (global-set-key (kbd "C-kp-4") 'srink-window-horizontally)
;; (global-set-key (kbd "C-kp-8") 'enlarge-window)
;; (global-set-key (kbd "C-kp-2") 'shrink-window)

;; Get rid of `find-file-read-only' and replace it with something more useful
(global-set-key (kbd "C-x C-r") 'ido-recentf-open-fancy)
;; Open dired with "C-x C-d", instead of directory listing
(global-set-key (kbd "C-x C-d") 'dired)

;; Set and jump to mark
(global-set-key (kbd "C-`") 'push-mark-no-activate)
(global-set-key (kbd "M-`") 'jump-to-mark)

(global-set-key (kbd "<f1>") 'eshell)

;; ==============================
;; Keybinds minor mode
;; ==============================

;; Easily stomp over global keybinds by activating this minor mode
(defvar iron-keys-mode-map (make-keymap) "iron-keys-mode keymap.")
(define-minor-mode iron-keys-mode
  "A minor mode so that my keybindings override annoying major modes."
  t " IK" 'iron-keys-mode-map)

;; Window management:
(define-key iron-keys-mode-map (kbd "M-1") 'delete-other-windows)
(define-key iron-keys-mode-map (kbd "M-2") 'split-window-below)
(define-key iron-keys-mode-map (kbd "M-3") 'split-window-right)
(define-key iron-keys-mode-map (kbd "M-4") 'delete-window)
(define-key iron-keys-mode-map (kbd "M-0") 'delete-window)
(define-key iron-keys-mode-map (kbd "M-o") 'other-window)
(define-key iron-keys-mode-map (kbd "M-k") 'my-server-kill-this-buffer)
(define-key iron-keys-mode-map (kbd "M-<left>") 'windmove-left)
(define-key iron-keys-mode-map (kbd "M-<right>") 'windmove-right)
(define-key iron-keys-mode-map (kbd "M-<up>") 'windmove-up)
(define-key iron-keys-mode-map (kbd "M-<down>") 'windmove-down)

;; Who moves by word anyway? Rebind these to more useful commands:
;; (define-key iron-keys-mode-map (kbd "M-f") 'find-file)
;; (define-key iron-keys-mode-map (kbd "M-b") 'switch-to-buffer)

(defun iron-keys-mode-disable ()
  (iron-keys-mode 0))

;; Turn them off in the minibuffer
(add-hook 'minibuffer-setup-hook 'iron-keys-mode-disable)

;; Activate iron keys
(iron-keys-mode 1)
