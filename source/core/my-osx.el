;;; me-osx.el --- me osx related config
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

  ;; Unbind left alt
(setq ns-right-alternate-modifier nil)
;; Or both alts
;;(setq mac-option-modifier nil)))

(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

;;;
;; copy & paste
;;
;; Credits:
;; http://stackoverflow.com/questions/9985316/how-to-paste-to-emacs-from-clipboard
(defun copy-from-osx  ()
  (shell-command-to-string  "pbpaste"))

(defun paste-to-osx  (text &optional push)
  (let  ((process-connection-type nil))
    (let  ((proc  (start-process  "pbcopy"  "*Messages*"  "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
;; << copy & paste end

;; Use aspell for spelling if it's available
(when (executable-find "aspell")
  (setq ispell-program-name (executable-find "aspell")))

;; OSX ls doesn't support --dired
(setq dired-use-ls-dired nil)

(when (display-graphic-p)
  ;; Fix path on OSx
  (my/set-exec-path-from-shell-PATH)

  ;; Use proper sRGB
  ;; http://lists.gnu.org/archive/html/emacs-devel/2013-12/msg00741.html
  (setq ns-use-srgb-colorspace t)

  (setq ns-use-native-fullscreen t))

(provide 'my-osx)

;;; me-osx.el ends here

