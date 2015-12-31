
(when (version< emacs-version "24.1")
  (error "Emacs version 24.1+ required. You're currently running %s" emacs-version))

(setq load-prefer-newer t)

;; incorporate some of magnars awesome emacs stuff
;; https://github.com/magnars/.emacs.d/blob/bc02c2d8853afc8ee61cc705945b47c725b9fb65/settings/key-bindings.el

;; Set up dirs & load-path
(defvar me/core-dir
  (expand-file-name "source/core" user-emacs-directory))
(defvar me/conf-dir
  (expand-file-name "source/conf" user-emacs-directory))
;; Put manually managed stuff in here
(defvar me/user-dir
 (expand-file-name "source/user" user-emacs-directory))
(defvar me/tmp-dir
 (expand-file-name "tmp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path me/core-dir)
(add-to-list 'load-path me/conf-dir)
(add-to-list 'load-path me/user-dir)

(require 'me-setup)

(defvar my-packages
  '(browse-kill-ring
     diminish
     company
     flycheck
     expand-region
     ace-jump-mode
     yaml-mode
     web-mode
     flx-ido
     popwin

     gitconfig-mode
     gitignore-mode
     git-gutter

     markdown-mode
     magit
     gist
     helm
     yasnippet
     undo-tree
     neotree

     move-text

     projectile
     helm-projectile
     rainbow-mode
     rainbow-delimiters

     evil
     evil-leader
     evil-escape
     evil-smartparens

     dash
     cider
     clojure-mode
     ))

(me/install-packages my-packages)

;; Expects `git submodule update --init --recursive` in ~/.emacs.d
;; to have happened
(me/rec-add-folder-to-load-path me/user-dir)

;; Finally configure all the packages
(me/require-in-folder me/conf-dir)
