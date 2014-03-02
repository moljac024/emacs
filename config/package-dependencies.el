;;===============================
;; Needed packages
;;===============================

(defvar needed-packages '(
    auto-complete         ;; Auto completion
    ac-dabbrev            ;; Auto complete backend for dabbrev
    ace-jump-mode         ;; Faster navigation (like vim )
    bash-completion       ;; Bash completion for the shell buffer
    clojure-mode          ;; Major mode for clojure
    coffee-mode           ;; Major mode for coffee
    cperl-mode            ;; Major mode for perl
    haml-mode             ;; Major mode for haml
    haskell-mode          ;; Major mode for haskell
    projectile            ;; Manage and navigate projects
    flycheck              ;; Flymake done right - on the fly syntax checking
    jade-mode             ;; Major mode for jade templates
    js2-mode              ;; Major mode for Javascript
    jinja2-mode           ;; Major mode for jinja templates
    evil                  ;; Vim emulation
    surround              ;; Vim surround plugin
    jedi                  ;; Python code completion
    key-chord             ;; Key chords
    lua-mode              ;; Major mode for lua
    inf-ruby              ;; Ruby inferior repl
    helm                  ;; Helm
    helm-git-grep         ;; Incremental git grep from helm
    magit                 ;; Awesome git interface
    markdown-mode         ;; Major mode for markdown
    cider                 ;; REPL for clojure
    openwith              ;; Dired open with external app
    org                   ;; Most awesome emacs app
    php-mode              ;; Major mode for php
    rainbow-mode          ;; Css pretty colors
    rainbow-delimiters    ;; Color parenthesis
    ruby-mode             ;; Major mode for ruby
    scala-mode2           ;; Major mode for scala
    slime                 ;; LISP development
    undo-tree             ;; Linear undo
    sass-mode             ;; Major mode for SASS
    yaml-mode             ;; Major mode for YAML
    virtualenv            ;; Minor mode for python virtual environemnts
    smex                  ;; Better M-x
    yasnippet             ;; Code snippets
    solarized-theme       ;; Solarized theme
    zenburn-theme         ;; Zenburn theme
    moe-theme             ;; Moe-theme
    flx-ido               ;; Better fuzzy matching for ido
    ido-ubiquitous        ;; Use ido everywhere
    ido-vertical-mode     ;; Vertical layout for ido
    golden-ratio          ;; Automatically resize windows
) "A list of packages to ensure are installed at launch.")


(defun needed-packages-installed-p ()
  "If all needed packages installed"
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
