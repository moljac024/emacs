;; Don't nag about deleting buffers
(setq ibuffer-expert t)

;; Auto refresh
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

;; Don't show empty buffer groups
(setq ibuffer-show-empty-filter-groups nil)

;; Set default sorting
(setq ibuffer-default-sorting-mode 'major-mode)

;; Buffer grouping rules for ibuffer - original
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
