;;===============================
;; Needed packages
;;===============================

(defvar needed-packages '(
    auto-complete        ;; Auto completion
    ac-dabbrev           ;; Auto complete backend for dabbrev
    ace-jump-mode        ;; Faster navigation (like vim )
    autopair             ;; Automatically close pairs like brackets quotes etc.
    bash-completion      ;; Bash completion for the shell buffer
    clojure-mode         ;; Major mode for clojure
    coffee-mode          ;; Major mode for coffee
    cperl-mode           ;; Major mode for perl
    haml-mode            ;; Major mode for haml
    haskell-mode         ;; Major mode for haskell
    helm                 ;; Incremental and narrowing framework
    helm-projectile      ;; Helm integration with projectile
    projectile           ;; Manage and navigate projects
    flycheck             ;; Flymake done right - on the fly syntax checking
    jade-mode            ;; Major mode for jade templates
    js2-mode             ;; Major mode for Javascript
    jinja2-mode          ;; Major mode for jinja templates
    epc                  ;; RPC stack for elisp
    evil                 ;; Vim emulation
    surround             ;; Vim surround plugin
    jedi                 ;; Autocomplete
    key-chord            ;; Key chords
    lua-mode             ;; Major mode for lua
    inf-ruby             ;; Ruby inferior repl
    magit                ;; Awesome git interface
    markdown-mode        ;; Major mode for markdown
    nrepl                ;; REPL for clojure
    openwith             ;; Dired open with external app
    org                  ;; Most awesome emacs app
    php-mode             ;; Major mode for php
    rainbow-mode         ;; Css pretty colors
    rainbow-delimiters   ;; Color parenthesis
    ruby-mode            ;; Major mode for ruby
    rvm                  ;; Ruby version manager
    scala-mode2          ;; Major mode for scala
    slime                ;; LISP development
    undo-tree            ;; Linear undo
    sass-mode            ;; Major mode for SASS
    yaml-mode            ;; Major mode for YAML
    virtualenv           ;; Minor mode for python virtual environemnts
    smex                 ;; Better M-x
    ;; yasnippet         ;; Snippets
    solarized-theme      ;; Solarized theme
    zenburn-theme        ;; Zenburn theme
    moe-theme            ;; Moe-theme
) "A list of packages to ensure are installed at launch.")
