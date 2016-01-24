
(smartparens-global-mode t)
(smartparens-global-strict-mode t)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

(sp-pair "'" nil :actions :rem)
(sp-pair "`" nil :actions :rem)

;;(sp-local-pair 'clojure-mode "{" nil :actions nil)
;;(sp-local-pair 'cider-repl-mode "{" nil :actions nil)
;;
