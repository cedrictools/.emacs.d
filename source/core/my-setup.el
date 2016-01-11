;;;; my-setup.el --- basic emacs setup
;;
;; Copyright (c) 2015 Fabio Bernasconi
;;
;; Author: Fabio Bernasconi <me@instilled.org>
;; URL: https://github.com/instilled/.emacs.d
;; Version: 0.0.1
;; Keywords: clojure

;;; Commentary:

;; Core stuff

;;; License:

;; Copyright © 2015 Fabio Bernasconi <me@instilled.org>
;; This work is free. You can redistribute it and/or modify it under the
;; terms of the Do What The Fuck You Want To Public License, Version 2,
;; as published by Sam Hocevar. See the LISENCE file for more details.

;;

;;; Code:

(require 'my-utils)
(require 'my-packages)

(setq inhibit-startup-message t)

;; More sane garbage collection threashold
(setq gc-cons-threshold
      20000000)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(my/touch
  (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Emacs server

;;(defvar my/server-socket-dir
;; (my/make-dir my/tmp-dir "server-sockets"))
;;(setq server-socket-dir memacs/server-socket-dir)
(setq server-name "emacs-server")
(when (require 'server nil t)
  (unless (server-running-p)
    (server-start)))

;; Inhibit startup screen
(setq inhibit-startup-screen t)
;;(setq initial-buffer-choice t)

;; Larger font
(set-default-font "Meslo LG L 14")

;; Syntax highlighting
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Cursor customization
(setq-default cursor-type 'box)
(setq blink-cursor-interval 1.0)
(blink-cursor-mode 1)

;; Show keystrokes immediately
(setq echo-keystrokes 0.1)

;; Show line & column numbers
(line-number-mode 1)
(column-number-mode 1)

;; wrap at 80 columns - 70 is mad
(setq-default fill-column 80)

;; Disable bell
(defun my-bell-function ())
(setq ring-bell-function 'my-bell-function)

;; UTF-8 FTW
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Whitespace related
(whitespace-mode -1)
(setq require-final-newline t)
(setq-default show-trailing-whitespace t)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Make search highlight occurences
(setq search-highlight t)
(setq query-replace-highlight t)

;; Simple y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Identation uses 4 spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Backup and autosave, see http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist
      `(("." . ,my/tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,my/tmp-dir t)))
(setq auto-save-list-file-prefix
      (expand-file-name ".saves-" my/tmp-dir))
(setq undo-tree-history-directory-alist
      `((".*" . ,my/tmp-dir)))
(setq undo-tree-auto-save-history t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)
;; avoid nasty .# lock files
(setq create-lockfiles nil)

;; Make lines break
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Configure ido mode. This makes navigating in the minibuffer a swift.
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Highlight parens
(show-paren-mode 1)

(set-face-background 'show-paren-match "#666633")
(set-face-foreground 'show-paren-match "#000000")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(when (display-graphic-p)
  ;; Show help in the echo area instead of as a tooltip
  (tooltip-mode -1)

  ;; No dialogue boxes!
  (setq use-dialog-box nil)

  ;; From:
  ;; http://emacs-fu.blogspot.co.uk/2011/01/setting-frame-title.html
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                   "%b")))))

;; smart beginning-of-line, from: http://irreal.org/blog/?p=1946
(defadvice move-beginning-of-line (around smarter-bol activate)
           ;; Move to requested line if needed.
           (let ((arg (or (ad-get-arg 0) 1)))
             (when (/= arg 1)
               (forward-line (1- arg))))
           ;; Move to indentation on first call, then to actual BOL on second.
           (let ((pos (point)))
             (back-to-indentation)
             (when (= pos (point))
               ad-do-it)))

;; stop allowing point over minibuffer prompt
;; http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
(setq minibuffer-prompt-properties (add-to-list 'minibuffer-prompt-properties 'minibuffer-avoid-prompt))
(setq minibuffer-prompt-properties (add-to-list 'minibuffer-prompt-properties 'point-entered))

;; ediff mode
;; make two side-by-side windows
(setq ediff-split-window-function 'split-window-horizontally)
;; ignore whitespace diffs
(setq ediff-diff-options "-w")
;; Do everything in one frame always
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)

  (global-set-key
    [mouse-4]
    (lambda ()
      (interactive)
      (scroll-down 1)))

  (global-set-key
    [mouse-5]
    (lambda ()
      (interactive)
      (scroll-up 1)))

  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(when (my/darwin-p)
  (require 'my-osx))

(provide 'my-setup)
