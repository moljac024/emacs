;;===============================
;; Buffers
;;===============================

;; Don't nag about creating nonexisting buffers
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)

;; Don't nag about killing buffers? Not sure...
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Ibuffer - don't nag about deleting buffers
(setq ibuffer-expert t)
;; Ibuffer - auto refresh
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
;; Ibuffer - don't show empty buffer groups
(setq ibuffer-show-empty-filter-groups nil)
;; Ibuffer - set default sorting
(setq ibuffer-default-sorting-mode 'major-mode)

;; ;; Buffer grouping rules for ibuffer - original
(setq ibuffer-saved-filter-groups
      (quote (("Default"
               ("Shell or Terminal" (or
                                     (mode . term-mode)
                                     (mode . ansi-term-mode)
                                     (mode . shell-mode)
                                     (mode . eshell-mode)))
               ("Images" (or
                          (mode . image-mode)))
               ("Documents" (or
                             (mode . doc-view-mode)))
               ("Directories" (or
                               (mode . dired-mode)
                               (mode . wdired-mode)))
               ("Organization" (or
                                (name . "^\\*Calendar\\*$")
                                (mode . org-mode)))
               ("Mail & News" (or
                               (mode . message-mode)
                               (mode . bbdb-mode)
                               (mode . mail-mode)
                               (mode . gnus-group-mode)
                               (mode . gnus-summary-mode)
                               (mode . gnus-article-mode)))
               ("Web" (or
                       (mode . w3-mode)
                       (mode . w3m-mode)))
               ("Chat" (or
                        (mode . rcirc-mode)
                        (mode . erc-mode)))
               ("Multimedia" (or
                              (name . "^\\*Playlist\\*$")
                              (name . "^\\*Music\\*$")
                              (name . "^\\*Multimedia\\*$")
                              (mode . emms-browser-mode)
                              (mode . emms-playlist-mode)))
               ("Help" (or
                        (mode . woman-mode)
                        (mode . Man-mode)
                        (mode . Info-mode)
                        (mode . apropos-mode)
                        (mode . help-mode)))
               ("Emacs" (or
                         (mode . Custom-mode)
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Shell Command Output\\*$")
                         (name . "^\\*Buffer List\\*$")
                         (name . "^\\*Completions\\*$")
                         (name . "^\\*Warnings\\*$")
                         (name . "^\\*Messages\\*$")
                         (name . "^\\*Gnu Emacs\\*$")
                         (name . "^[*].*[*]$")))
               ("Files" (filename . ".*"))))))

;; Reverse the groups order in ibuffer - so that default comes first
(defadvice ibuffer-generate-filter-groups (after reverse-ibuffer-groups ()
                                                 activate)
  (setq ad-return-value (nreverse ad-return-value)))

;; Activate groupings
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "Default")))

;; Ibuffer keybinds
(add-hook 'ibuffer-load-hook
          (lambda (&rest ignore)
            (define-key ibuffer-mode-map
              (kbd "U") 'ibuffer-unmark-all)
            (define-key ibuffer-mode-map
              (kbd "C-x C-f") 'ibuffer-ido-find-file)
            ))

;; Switching to ibuffer puts the cursor on the most recent buffer
(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name"
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)

(defun my-kill-this-buffer ()
  "Kill the currently focused buffer, with some special handling"
  (interactive)
  (let ((kill-buffer-modes-ignore '(shell-mode eshell-mode term-mode))
        (kill-buffer-names-ignore '("*scratch*")))
    (if (or (member major-mode kill-buffer-modes-ignore)
            (member (buffer-name) kill-buffer-names-ignore))
        (switch-to-previous-buffer)
      (kill-buffer (current-buffer)))))

(defun my-server-kill-this-buffer ()
  "Kill the currently focused buffer, edited in server mode"
  (interactive)
  (if server-buffer-clients
      (server-edit)
    (my-kill-this-buffer)))

(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (insert initial-scratch-message)
  (lisp-interaction-mode))

;; Switch to last visited buffer
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer))))

;; Ibuffer ido find file
(defun ibuffer-ido-find-file ()
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (ido-find-file-in-dir default-directory))))

;; Better unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
