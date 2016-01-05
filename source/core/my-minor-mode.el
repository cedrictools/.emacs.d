;;; my-minor-mode.el --- custom minor mode
;;
;; Copyright (c) 2015 Fabio Bernasconi
;;
;; Author: Fabio Bernasconi <me@instilled.org>
;; URL: https://github.com/instilled/.emacs.d
;; Version: 0.0.1
;; Keywords: clojure

;;; Commentary:

;; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
;; "This has the added benefit of being able to turn off all my
;; modifications in one fell swoop (just disable the minor mode) in
;; case someone else is driving the keyboard or if I need to see what a
;; default key binding does."

;;; License:

;; Copyright © 2015 Fabio Bernasconi <me@instilled.org>
;; This work is free. You can redistribute it and/or modify it under the
;; terms of the Do What The Fuck You Want To Public License, Version 2,
;; as published by Sam Hocevar. See the LISENCE file for more details.

;;

;;; Code:

(defvar my/my-keys-minor-mode-map (make-keymap)
  "my/my-keys-minor-mode keymap.")

(define-minor-mode my/my-keys-minor-mode
  "A minor mode so that key settings override annoying major modes."
  t "" 'my/my-keys-minor-mode-map)

(my/my-keys-minor-mode 1)

;; Let the keybinding "retain precedence, even if subsequently-loaded
;; libraries bring in new keymaps of their own." (same SO link)
(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my/my-keys-minor-mode))
      (let ((mykeys (assq 'my/my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my/my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)


(defvar my/my-keys-prefix "C-,"
  "A global convenience prefix.")

;; Adapted from evil-leader/set-key
;; Credits: thanks unthought
(defun my/my-keys-set-prefixed (key def &rest bindings)
  "Set keys into my/my-keys-minor-mode-map using the 'kbd' and using
my/my-keys-prefix."
  (interactive "kKey: \naCommand: ")
  (while key
    (define-key my/my-keys-minor-mode-map (read-kbd-macro (concat my/my-keys-prefix " " key)) def)
    (setq key (pop bindings) def (pop bindings))))

;; -----------------------------------------------------------------------------
;; Let the bindings strart
;;(global-set-key my/my-keys-minor-mode-map (kbd "C-,") nil)
(global-set-key (kbd "C-. C-l") 'align-regexp)

(message "Hello")
;;(my/my-keys-set-prefixed "a "      'align-regexp)
;;(my/my-keys-set-prefixed "C-s"     'save-buffer)
;;(my/my-keys-set-prefixed "u "      'undo-tree-visualize)
;;(my/my-keys-set-prefixed "o "      'shell-command)
;;;;(my/my-keys-set-prefixed "C-t"     'next-multiframe-window)
;;;;(my/my-keys-set-prefixed "C-."     'keyboard-quit)
;;(my/my-keys-set-prefixed "C-,"     'execute-extended-command)
;;(my/my-keys-set-prefixed "f "      'ido-find-file-other-window)
;;(my/my-keys-set-prefixed "C-f"     'ido-find-file)
;;(my/my-keys-set-prefixed "M-f"     'ffap)
;;
;;(my/my-keys-set-prefixed "m w"     'mark-word)
;;(my/my-keys-set-prefixed "m s"     'mark-sexp)
;;(my/my-keys-set-prefixed "m f"     'mark-defun)
;;
;;;; Magit
;;(my/my-keys-set-prefixed "v s"     'magit-status)
;;(my/my-keys-set-prefixed "v c"     'magit-commit)
;;
;;;; Navigational
;;(my/my-keys-set-prefixed "n c"     'ace-jump-char-mode)
;;(my/my-keys-set-prefixed "n l"     'ace-jump-line-mode)
;;(my/my-keys-set-prefixed "n g"     'goto-line)
;;(my/my-keys-set-prefixed "n w"     'ace-jump-word-mode)

(provide 'my-minor-mode)

;;; my-minor-mode.el ends here
