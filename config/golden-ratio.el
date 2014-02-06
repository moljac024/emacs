;; Advise windmove functions to be aware of golden ratio
(defadvice windmove-left (after windmove-left-golden activate)
  (golden-ratio))
(defadvice windmove-right (after windmove-right-golden activate)
  (golden-ratio))
(defadvice windmove-up (after windmove-up-golden activate)
  (golden-ratio))
(defadvice windmove-down (after windmove-down-golden activate)
  (golden-ratio))

;; Activate golden ratio
(require 'golden-ratio)
(golden-ratio-mode 1)
