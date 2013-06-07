;;===============================
;; Dired
;;===============================

;; Automatically revert (refresh) dired buffers when they are visited
(setq dired-auto-revert-buffer t)
;; Dired - sort directories first, filenames by extension, don't display . and ..
(when (equal system-type 'gnu/linux) ;; Do this only if system is linux
  (setq dired-listing-switches "-lhaD --group-directories-first"))
;; Make copy automatically select the directory in other dired buffer in split window mode
(setq dired-dwim-target t)
;; Dired - delete or copy a whole directory
(setq dired-recursive-copies 'always) ;; Always means no asking
(setq dired-recursive-deletes 'top)   ;; Top means ask once for top dir only
;; (setq dired-no-confirm '(delete))

;; Mark hidden files as uninteresting
;; (setq dired-omit-files "^[.].*$") ; Everything beggining with a dot
(setq dired-omit-files "^[.][^.].*$") ;; Everything beggining with a dot except the special "." and ".."

;; Silently omit files
(setq dired-omit-verbose nil)

;; No confirmation on file delete - clever hack
(setq dired-deletion-confirmer '(lambda (x) t))

(defun my-dired-omit ()
  (let ((dired-omit-dirs '("~/" "/home/bojan/")))
    (if (member dired-directory dired-omit-dirs)
        (dired-omit-mode 1))))

;; Don't show hidden files and refresh directory on change
(add-hook 'dired-mode-hook (lambda ()
                             (setq truncate-lines t)
                             (auto-revert-mode)
                             (my-dired-omit)))

;; Uncompress .zip files with "Z" too
(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))

;; Orthodox file manager keybinds (mc/total commander)
;; (add-hook 'dired-load-hook
(add-hook 'dired-mode-hook
          (lambda (&rest ignore)
            (define-key dired-mode-map
              (kbd "RET") 'dired-find-file-or-launch-command)
            (define-key dired-mode-map
              (kbd "C-M-j") 'dired-launch-command)
            (define-key dired-mode-map
              (kbd "M-RET") 'dired-launch-command)
            (define-key dired-mode-map
              (kbd "C-j") 'dired-find-file-other-window)
            (define-key dired-mode-map
              (kbd "o") 'dired-find-file)
            (define-key dired-mode-map
              (kbd "<C-return>") 'dired-find-file-other-window)
            (define-key dired-mode-map
              (kbd "h") 'dired-omit-mode) ;; Toggle showing of hidden files with h
            (define-key dired-mode-map
              (kbd "s") 'emms-add-dired) ;; Add marked files to emms playlist
            (define-key dired-mode-map
              (kbd "z") 'dired-zip-files) ;; Zip files with "z" - function defined below
            (define-key dired-mode-map
              (kbd "DEL") 'dired-up-directory) ;; Go up a directory with backspace
            (define-key dired-mode-map
              (kbd "r") 'wdired-change-to-wdired-mode) ;; Rename files in dired with r (enter wdired-mode)
            (define-key dired-mode-map
              (kbd "TAB") 'other-window) ;; Change to other frame
            (define-key dired-mode-map
              (kbd "M-r") 'revert-buffer) ;; Redraw dired buffer
            (define-key dired-mode-map
              (kbd "C-c m a") 'dired-add-to-playlist) ;; Add to EMMS playlist
            ))

;; Editable dired keybinds
(add-hook 'wdired-mode-hook
          (lambda (&rest ignore)
            (define-key wdired-mode-map
              (kbd "RET") 'wdired-finish-edit) ;; End renames and save changes with enter
            (define-key wdired-mode-map
              (kbd "TAB") 'wdired-abort-changes) ;; Abort changes with TAB
            (define-key wdired-mode-map
              (kbd "C-c C-C") 'wdired-abort-changes) ;; Abort changes with C-c C-c
            ))

;; Launch files in remote application for appropriate extensions:
(defun dired-find-file-or-launch-command ()
  (interactive)
  (let ((dired-launch-extensions '("mp4" "avi" "mkv" "mpg" "mpeg" "flv" "ogv" "wmv")))
    (if (or (file-directory-p (dired-file-name-at-point)) (equal (file-name-extension (dired-file-name-at-point)) nil))
        (dired-find-file)
      (if (member-ignore-case (file-name-extension
                               (dired-file-name-at-point)) dired-launch-extensions)
          (dired-launch-command)
        (dired-find-file)))))

;; Launch files in default applications instead of emacs
(defun dired-launch-command ()
  (interactive)
  (dired-do-shell-command
   (case system-type
     (gnu/linux "thunar 1>/dev/null 2>&1") ; Need to have thunar installed
     (darwin "open")
     (windows-nt "cmd /c start"))
   nil
   (dired-get-marked-files t current-prefix-arg)))

;; Extra functionality
(require 'dired-x)
