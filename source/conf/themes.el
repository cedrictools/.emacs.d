

(when (my/is-terminal-p)
  (add-to-list
   'custom-theme-load-path
   (expand-file-name "emacs-color-theme-solarized" my/user-dir))
  (load-theme 'solarized t))

(unless (my/is-terminal-p)
  (load-theme 'solarized-dark)
  (set-face-attribute 'region nil :background "#002b36" :foreground "#586e75"))
