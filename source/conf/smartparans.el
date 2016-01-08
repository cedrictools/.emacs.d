(smartparens-global-mode t)

(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(smartparens-global-strict-mode t)
