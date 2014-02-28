;; ==============================
;; Clear bindings
;; ==============================

;; Remove M-number bindings (default is universal argument)
;; (global-unset-key (kbd "M-1"))
;; (global-unset-key (kbd "M-2"))
;; (global-unset-key (kbd "M-3"))
;; (global-unset-key (kbd "M-4"))
;; (global-unset-key (kbd "M-5"))
;; (global-unset-key (kbd "M-6"))
;; (global-unset-key (kbd "M-7"))
;; (global-unset-key (kbd "M-8"))
;; (global-unset-key (kbd "M-9"))
;; (global-unset-key (kbd "M-0"))
;; (global-unset-key (kbd "M-o"))

;; ==============================
;; Iron keys
;; ==============================

;; Easily stomp over global keybinds by activating this minor mode
(defvar iron-keys-mode-map (make-keymap) "iron-keys-mode keymap.")
(define-minor-mode iron-keys-mode
  "A minor mode so that your keybindings override major modes."
  t " IK" 'iron-keys-mode-map)
(defun iron-keys-mode-disable ()
  (iron-keys-mode 0))

;; Turn iron keys off in the minibuffer
(add-hook 'minibuffer-setup-hook 'iron-keys-mode-disable)

(defun iron-keys-ensure-priority ())
"Ensure iron keys have priority"
(if (not (eq (car (car minor-mode-map-alist)) 'iron-keys-minor-mode))
    (let ((mykeys (assq 'iron-keys-minor-mode minor-mode-map-alist)))
      (assq-delete-all 'iron-keys-minor-mode minor-mode-map-alist)
      (add-to-list 'minor-mode-map-alist mykeys)))

;; Reset iron keys priority after loading a new file
(defadvice load (after iron-keys-ensure-priority))
(ad-activate 'load)

(add-hook 'dired-mode-hook 'iron-keys-ensure-priority)

;; Window management:
(add-hook 'iron-keys-mode-hook
  (lambda (&rest ignore)
    (define-key iron-keys-mode-map (kbd "M-1") 'delete-other-windows)
    (define-key iron-keys-mode-map (kbd "M-2") 'split-window-below)
    (define-key iron-keys-mode-map (kbd "M-3") 'split-window-right)
    (define-key iron-keys-mode-map (kbd "M-4") 'delete-window)
    (define-key iron-keys-mode-map (kbd "M-0") 'delete-window)
    (define-key iron-keys-mode-map (kbd "M-o") 'other-window)
    (define-key iron-keys-mode-map (kbd "M-k") 'my-server-kill-this-buffer)
))

;; Who moves by word anyway? Rebind these to more useful commands:
;; (define-key iron-keys-mode-map (kbd "M-f") 'find-file)
;; (define-key iron-keys-mode-map (kbd "M-b") 'switch-to-buffer)

;; Activate iron keys
(iron-keys-mode 1)
