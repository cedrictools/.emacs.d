;;; me-packages.el --- me package functions
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

(require 'cl)
(require 'package)
(require 'me-utils)

(add-to-list
  'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list
  'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Custom elpa package directory
(setq package-user-dir (expand-file-name ".elpa" user-emacs-directory))
(package-initialize)

(defun me/packages-installed-p (packages)
  "Check if all packages in `me-packages' are installed."
  (every #'package-installed-p packages))

(defun me/require-package (package)
  "Install PACKAGE unless already installed."
  (unless (package-installed-p package)
    (package-install package)))

(defun me/require-packages (packages)
  "Ensure PACKAGES are installed.
  Missing packages are installed automatically."
  (mapc #'me/require-package packages))

(defun me/install-packages (packages)
  "Install all packages listed in `me/packages'."
  (unless (me/packages-installed-p packages)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (me/require-packages packages)))

(provide 'me-packages)

;;; me-packages.el ends here
