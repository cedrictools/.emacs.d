;;; me-utils.el --- me utility functions
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

(defun me/darwin-p ()
  (string-equal system-type "darwin"))

(defun me/nix-p ()
  (string-equal system-type "linux"))

(defun me/windows-p ()
  (string-equal system-type "linux"))

(defun me/touch (path)
  (shell-command (concat "touch " path) nil))

(defun me/make-dir (parent child)
  (let ((dir (concat parent child "/")))
    (when (not (file-directory-p dir))
      (make-directory dir))
    dir))

(defun me/string-ends-with-p (s ending)
  "Return non-nil if string S ends with ENDING."
  (cond ((>= (length s) (length ending))
         (let ((elength (length ending)))
           (string= (substring s (- 0 elength)) ending)))
        (t nil)))

(defun me/rec-add-folder-to-load-path (root-dir)
  "Add ROOT-DIR and all its subdirs to `load-path'."
  (when (and (file-directory-p root-dir)
             (not (me/string-ends-with-p root-dir "ignore")))
    (add-to-list 'load-path root-dir)
    (dolist (f (directory-files root-dir))
      (let ((name (expand-file-name f root-dir)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (me/rec-add-folder-to-load-path name))))))

(defun me/require-in-folder (dir)
 (dolist (f (directory-files dir))
   (let ((fname (expand-file-name f dir)))
    (when (file-regular-p fname)
     (load fname)))))

;; Fix the PATH variable
;; Credits to http://www.mail-archive.com/clojure@googlegroups.com/msg36929.html
(defun me/set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; Syntactic sugar for eval-after-load dance.
;; https://github.com/purcell/emacs.d/blob/aa789c9745b13612c4fea6e638d81d8ebbfecdf8/init-utils.el#L1-L5
(defmacro me/after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
                    '(progn ,@body)))

(provide 'me-utils)
