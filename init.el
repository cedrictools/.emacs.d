
(when (version< emacs-version "24.1")
  (error "Emacs version 24.1+ required. You're currently running %s" emacs-version))

(setq load-prefer-newer t)


;; incorporate some of magnars awesome emacs stuff
;; https://github.com/magnars/.emacs.d/blob/bc02c2d8853afc8ee61cc705945b47c725b9fb65/settings/key-bindings.el

;; Set up dirs & load-path
(defvar my/core-dir
  (expand-file-name "source/core/" user-emacs-directory))
(defvar my/conf-dir
  (expand-file-name "source/conf/" user-emacs-directory))
;; Put manually managed stuff in here
(defvar my/user-dir
 (expand-file-name "source/user/" user-emacs-directory))
(defvar my/tmp-dir
 (expand-file-name "tmp/" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path my/core-dir)
(add-to-list 'load-path my/conf-dir)
(add-to-list 'load-path my/user-dir)

(require 'my-setup)

;; Expects `git submodule update --init --recursive` in ~/.emacs.d
;; to have happened
(my/rec-add-folder-to-load-path my/user-dir)

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
     vline

     gitconfig-mode
     gitignore-mode
     git-gutter

     markdown-mode
     magit
     gist
     yasnippet
     smartparens
     undo-tree
     neotree
     window-numbering
     ;;project-explorer

     move-text

     projectile
     helm
     helm-ag
     helm-projectile
     rainbow-mode
     rainbow-delimiters
     solarized-theme

     hydra

     evil
     evil-leader
     evil-escape
     evil-smartparens

     dash
     cider
     clojure-mode))

(setq
  package-archives
  (nconc
   package-archives
   '(("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))

;; pinn packages to stable archives
(setq
 package-pinned-packages
 '((cider . "melpa-stable")
   (clojure-mode . "marmalade")))

(my/install-packages my-packages)
(my/require-packages
 (nconc
  my-packages
  '(dash-at-point)))

;; Finally configure all the packages
(my/require-in-folder my/conf-dir)
