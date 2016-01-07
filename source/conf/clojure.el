(add-to-list
 'dash-at-point-mode-alist
 '(clojure-mode . "clojure"))

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(setq cider-boot-parameters "dev repl -s wait")
