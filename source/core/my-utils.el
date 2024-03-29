;;; my-utils.el --- me utility functions
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

(defun my/darwin-p ()
  (string-equal system-type "darwin"))

(defun my/nix-p ()
  (string-equal system-type "linux"))

(defun my/windows-p ()
  (string-equal system-type "windows"))

(defun my/is-terminal-p ()
  "Whether emacs is run in terminal mode or not."
  (not (display-graphic-p)))

(defun my/touch (path)
  (shell-command (concat "touch " path) nil))

(defun my/make-dir (parent child)
  (let ((dir (concat parent child "/")))
    (when (not (file-directory-p dir))
      (make-directory dir))
    dir))

(defun my/string-ends-with-p (s ending)
  "Return non-nil if string S ends with ENDING."
  (cond ((>= (length s) (length ending))
         (let ((elength (length ending)))
           (string= (substring s (- 0 elength)) ending)))
        (t nil)))

(defun my/rec-add-folder-to-load-path (root-dir)
  "Add ROOT-DIR and all its subdirs to `load-path'."
  (when (and (file-directory-p root-dir)
             (not (my/string-ends-with-p root-dir "ignore")))
    (add-to-list 'load-path root-dir)
    (dolist (f (directory-files root-dir))
      (let ((name (expand-file-name f root-dir)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (my/rec-add-folder-to-load-path name))))))

(defun my/str-starts-with (s begins)
  "Return non-nil if string S starts with BEGINS."
  (cond ((>= (length s) (length begins))
         (string-equal (substring s 0 (length begins)) begins))
        (t nil)))

(defun my/require-in-folder (dir)
 (dolist (f (directory-files dir))
   (let ((fname (expand-file-name f dir)))
    (when (and (not (my/str-starts-with f "-"))
               (file-regular-p fname))
     (load fname)))))

;; Fix the PATH variable
;; Credits to http://www.mail-archive.com/clojure@googlegroups.com/msg36929.html
(defun my/set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; Syntactic sugar for eval-after-load dance.
;; https://github.com/purcell/emacs.d/blob/aa789c9745b13612c4fea6e638d81d8ebbfecdf8/init-utils.el#L1-L5
(defmacro my/after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
                    '(progn ,@body)))

(provide 'my-utils)
