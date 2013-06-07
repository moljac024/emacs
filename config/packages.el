;;===============================
;; Package management
;;===============================

;; Initialize package management
(package-initialize)
;; Add additional package archives
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Add a directory in home to load path
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; Install packages automagically
;; (lifted from Emacs prelude)

(defvar needed-packages
  '(
    auto-complete
    ac-dabbrev
    ace-jump-mode
    autopair
    bash-completion
    clojure-mode
    coffee-mode
    cperl-mode
    haml-mode
    haskell-mode
    helm
    helm-projectile
    jade-mode
    js2-mode
    jinja2-mode
    epc
    jedi
    key-chord
    lua-mode
    inf-ruby
    magit
    magithub
    markdown-mode
    multi-web-mode
    mmm-mako
    nrepl
    openwith
    org
    php-mode
    projectile
    rainbow-mode
    rainbow-delimiters
    ruby-mode
    rvm
    scala-mode2
    slime
    undo-tree
    sass-mode
    solarized-theme
    zenburn-theme
    yaml-mode
    yasnippet
    )
  "A list of packages to ensure are installed at launch.")

(defun needed-packages-installed-p ()
  (loop for p in needed-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (needed-packages-installed-p)
  ;; Check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (message "%s" "Emacs is now installing missing packages...")
  (dolist (p needed-packages)
    (when (not (package-installed-p p))
      (package-install p))))
  (message "%s" " done.")
