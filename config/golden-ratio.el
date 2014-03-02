;; ==============================
;; Golden ratio - automatic resizing of windows
;; ==============================

(defadvice other-window (after other-window-golden activate)
  (golden-ratio))

(require-package 'golden-ratio)
(require 'golden-ratio)

(golden-ratio-mode t)
