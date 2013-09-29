;;===============================
;; Dired
;;===============================

;; Automatically revert (refresh) dired buffers when they are visited
(setq dired-auto-revert-buffer t)

;; Customize dired listing on linux systems
(when (equal system-type 'gnu/linux)
  (setq dired-listing-switches "-lhaD --group-directories-first"))

;; Make copy automatically select the directory in other dired buffer
;; in split window mode
(setq dired-dwim-target t)

;; Delete or copy a whole directory
(setq dired-recursive-copies 'always) ;; Always means no asking
(setq dired-recursive-deletes 'top)   ;; Top means ask once for top dir only

;; Mark hidden files as uninteresting
(setq dired-omit-files "^[.][^.].*$")

;; Silently omit files
(setq dired-omit-verbose nil)

;; No confirmation on file delete - clever hack
(setq dired-deletion-confirmer '(lambda (x) t))

(defun my-dired-omit ()
  (let ((dired-omit-dirs '( "~/" (expand-file-name "~/"))))
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
(add-hook 'dired-load-hook
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
      (kbd "z") 'dired-zip-files) ;; Zip files
    (define-key dired-mode-map
      (kbd "DEL") 'dired-up-directory) ;; Go up a directory
    (define-key dired-mode-map
      (kbd "M-r") 'wdired-change-to-wdired-mode) ;; Rename files
    (define-key dired-mode-map
      (kbd "TAB") 'other-window) ;; Change to other frame
))

;; Editable dired keybinds
(add-hook 'wdired-mode-hook
  (lambda (&rest ignore)
    (define-key wdired-mode-map
      (kbd "RET") 'wdired-finish-edit) ;; End renames and save changes
    (define-key wdired-mode-map
      (kbd "C-c C-c") 'wdired-abort-changes) ;; Abort changes
))

(defun dired-find-file-or-launch-command ()
  "Dired file associations"
  (interactive)
  (let ((dired-launch-extensions '("mp4" "avi" "mkv" "mpg" "mpeg" "flv" "ogv" "wmv")))
    (if (or (file-directory-p (dired-file-name-at-point)) (equal (file-name-extension (dired-file-name-at-point)) nil))
        (dired-find-file)
      (if (member-ignore-case (file-name-extension
                               (dired-file-name-at-point)) dired-launch-extensions)
          (dired-launch-command)
        (dired-find-file)))))

(defun dired-launch-command ()
  "Launch file in default system application"
  (interactive)
  (dired-do-shell-command
   (case system-type
     (gnu/linux "thunar 1>/dev/null 2>&1") ; Need to have thunar installed
     (darwin "open")
     (windows-nt "cmd /c start"))
   nil
   (dired-get-marked-files t current-prefix-arg)))

;; Dired-x
(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))
(eval-after-load "dired-x"
  '(progn
     ;; Add an alternative local binding for the command
     ;; bound to M-o
     (define-key dired-mode-map (kbd "M-h")
       (lookup-key dired-mode-map (kbd "M-o")))
     ;; Unbind M-o from the local keymap
     (define-key dired-mode-map (kbd "M-o") nil)))
