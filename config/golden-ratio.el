;; ==============================
;; Golden ratio - automatic resizing of windows
;; ==============================

(require-package 'golden-ratio)
(require 'golden-ratio)

(golden-ratio-mode t)

(setq golden-ratio-extra-commands
      (append golden-ratio-extra-commands
              '(evil-window-left
                evil-window-right
                evil-window-up
                evil-window-down
                select-window-1
                select-window-2
                select-window-3
                select-window-4
                select-window-5)))
