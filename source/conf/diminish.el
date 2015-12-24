(require 'diminish)

(eval-after-load
  "undo-tree-mode"
  '(diminish 'undo-tree-mode))

(eval-after-load
  "company-mode"
  '(diminish 'company-mode))

(eval-after-load
  "smartparens"
  '(diminish 'smartparens-mode))

(eval-after-load
  "projectile"
  '(diminish 'projectile-mode))

(eval-after-load
  "yasnippet"
  '(diminish 'yas-minor-mode))

(eval-after-load
  "auto-complete"
  '(diminish 'auto-complete-mode))

(eval-after-load
  "whitespace-cleanup-mode"
  '(diminish 'whitespace-cleanup-mode))
