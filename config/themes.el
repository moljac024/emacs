;;===============================
;; Color themes
;;===============================

;; Additional color themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Zenburn color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/zenburn/")
;; Solarized color theme
(add-to-list 'load-path "~/.emacs.d/themes/solarized")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized/")
;; Set default desired theme
;; (setq custom-color-theme-default 'zenburn)
;; (setq custom-color-theme-default 'solarized-light)
(setq custom-color-theme-default 'moe-light)

;; Manage color themes with emacs server:
;; Assume color theme is wanted and enabled. When making a frame check
;; to see if it's a terminal frame and if it is, disable the theme,
;; enabling it again when the frame closes. This allows for using a
;; color theme that isn't terminal friendly in GUI emacs, while still
;; being able to fire up emacsclient from the terminal to make quick
;; edits without losing your sanity.

(defun custom-color-theme-enable ()
  (interactive)
  (if (boundp 'custom-color-theme-default)
      (progn
        (if (not (member custom-color-theme-default custom-known-themes))
            (load-theme custom-color-theme-default t))
        (progn
          (if (not (custom-theme-enabled-p custom-color-theme-default))
              (enable-theme custom-color-theme-default))))
            ;; (message "Theme is already enabled."))))
    (message "No default theme is set.")))

(defun print-known-themes ()
  (let (themes)
    (loop for theme in custom-known-themes do
          (if (and theme
                   (not (or
                         (equalp theme 'user)
                         (equalp theme 'changed))))
              (add-to-list themes theme)))
    (themes)))

(defun custom-color-theme-disable ()
  (interactive)
  (if (boundp 'custom-color-theme-default)
      (progn
        (if (custom-theme-enabled-p custom-color-theme-default)
            (disable-theme custom-color-theme-default)))
          ;; (message "Theme isn't enabled anyway.")))
    (message "No default theme is set.")))

(defun custom-color-theme-toggle ()
  "Toggle the active state of theme defined in custom-color-theme-toggle-theme"
  (interactive)
  (if (boundp 'custom-color-theme-default)
      (progn
        (if (custom-theme-enabled-p custom-color-theme-default)
            (custom-color-theme-disable)
          (custom-color-theme-enable)))
    (message "No default theme is set.")))

(defun color-theme-manage-frame-creation (frame)
  (if (equalp (framep frame) 't)
      (custom-color-theme-disable)
    (custom-color-theme-enable)))

(defun color-theme-manage-frame-deletion (frame)
  (if (equalp (framep frame) 't)
      (custom-color-theme-enable)))

(defun color-theme-activate-frame-creation (frame)
  (if (equalp (framep frame) 'x)
      (custom-color-theme-enable)))

(global-set-key (kbd "C-c C-t") 'custom-color-theme-toggle)

;; (add-hook 'after-make-frame-functions 'color-theme-manage-frame-creation)
;; (add-hook 'delete-frame-functions 'color-theme-manage-frame-deletion)
(add-hook 'after-make-frame-functions 'color-theme-activate-frame-creation)
;; If emacs is started directly, then the frame is already made, so
;; check for that.

(color-theme-activate-frame-creation (selected-frame))
