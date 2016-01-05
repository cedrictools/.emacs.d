;;; my-packages.el --- me package functions
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
(require 'my-utils)

;; Custom elpa package directory
(setq package-user-dir (expand-file-name ".pkgs" user-emacs-directory))
(package-initialize)

(defun my/packages-installed-p (packages)
  "Check if all packages in `my-packages' are installed."
  (every #'package-installed-p packages))

(defun my/install-package (package)
  "Install PACKAGE unless already installed."
  (unless (package-installed-p package)
    (package-install package)))

(defun my/install-packages (packages)
  "Install all packages listed `packages'."
  (unless (my/packages-installed-p packages)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (mapc #'my/install-package packages)))

(provide 'my-packages)

;;; my-packages.el ends here
