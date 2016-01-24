;; TODO

(global-set-key (kbd "M-[ d") 'sp-forward-barf-sexp)
(global-set-key (kbd "M-[ c") 'sp-forward-slurp-sexp)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

;; Evil related

(global-set-key (kbd "C-g") 'evil-escape)
(global-set-key (kbd "C-c C-c") 'evil-escape)

;; see https://github.com/davvil/.emacs.d/blob/master/init.el#L19
;;(defun minibuffer-keyboard-quit ()
;;  "Abort recursive edit.
;;In Delete Selection mode, if the mark is active, just deactivate it;
;;then it takes a second \\[keyboard-quit] to abort the minibuffer."
;;  (interactive)
;;  (if (and delete-selection-mode transient-mark-mode mark-active)
;;      (setq deactivate-mark  t)
;;    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;;    (abort-recursive-edit)))
;;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;;(define-key evil-visual-state-map [escape] 'keyboard-quit)
;;(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;;(global-set-key (kbd "C-k") (lambda () (interactive) (evil-previous-line 10)))
;;(global-set-key (kbd "C-j") (lambda () (interactive) (evil-next-line 10)))
;;

(define-key evil-visual-state-map (kbd "a f") 'sp-select-next-thing)

;; align complete buffer
(defun align-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f12] 'indent-buffer)

(evil-leader/set-leader ",")
(evil-leader/set-key
  ","   'helm-M-x
  "."   'eval-buffer
  "c"   'comment-or-uncomment-region
  "d"   'dash-at-point
  "a r" 'align-regexp
  "a a" 'align-buffer
  "SPC" 'evil-ace-jump-word-mode
  "u"   'undo-tree-visualize
  "b"   'helm-buffers-list
  "p"   'helm-projectile
  "P"   'helm-projectile-ag
  "f"   'neotree-find
  "F"   'helm-find-files)

(global-set-key (kbd "C-k") (lambda () (interactive) (evil-previous-line 10)))
(global-set-key (kbd "C-j") (lambda () (interactive) (evil-next-line 10)))

;; Smartparens
(defhydra hydra-smartparens-menu nil
  "sp"
  ("j" sp-next-sexp "nxt")
  ("k" sp-backward-up-sexp "prv")

  ("e" sp-forward-slurp-sexp "slrp")
  ("n" sp-forward-barf-sexp "brf")
  ("s" sp-backward-slurp-sexp "b-slrp")
  ("t" sp-backward-barf-sexp "b-brf")
  ("g" sp-select-pervious-thing-exchange "sel")
  ("l" sp-select-next-thing-exchange "b-sel")

  ("d" sp-kill-sexp "kill"))
(evil-leader/set-key
  "s"   'hydra-smartparens-menu/body)

(evil-declare-key 'normal clojure-mode-map (kbd "{")
  (sp-restrict-to-object-interactive 'sp-prefix-pair-object 'sp-forward-sexp))
 ;; (sp-restrict-to-pairs-interactive '("{" "[") 'sp-down-sexp))

;; Text ops
(defhydra hydra-textop-menu nil
  "mv"
  ("k" move-text-up "up")
  ("j" move-text-down "down")
  ("s" transpose-sexps "sexp"))
(evil-leader/set-key
  "t"   'hydra-textop-menu/body)

;; Modes
(defhydra hydra-modes-menu nil
  "modes"
  ("v" vline-mode "vline")
  ("h" hl-line-mode "hline")
  ("e" evil-smartparens-mode "evil-sp"))
(evil-leader/set-key
  "q"   'hydra-modes-menu/body)

;; Magit
(defhydra hydra-magit-menu nil
  "modes"
  ("s" magit-status "status"))
(evil-leader/set-key
  "v"   'hydra-magit-menu/body)

;; Projectile
(defhydra hydra-projectile-menu nil
  "projectile"
  ("p" projectile-switch-project "switch project")
  ("t" projectile-find-test-file "test files")
  ("r" projectile-replace "query-replace"))
(evil-leader/set-key
  "m"  'hydra-projectile-menu/body)

;; Navigation
(defhydra hydra-navigation-menu nil
  "nav"
  ("l" evil-ace-jump-line-mode "line")
  ("i" evil-ace-jump-char-mode "char")
  ("o" other-window "owin"))
(evil-leader/set-key
  "n"  'hydra-navigation-menu/body)


;; Company

(define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)


;; Neotree
(defhydra hydra-neotree-menu nil
  "neotree"
  ("a" neotree-create-node "create")
  ("m" neotree-rename-node "rename")
  ("c" neotree-copy-node "copy")
  ("d" neotree-delete-node "delete"))
(evil-declare-key 'normal neotree-mode-map (kbd  "m") 'hydra-neotree-menu/body)
(evil-declare-key 'normal neotree-mode-map (kbd  "k") 'neotree-previous-line)
(evil-declare-key 'normal neotree-mode-map (kbd  "j") 'neotree-next-line)
(evil-declare-key 'normal neotree-mode-map (kbd  "RET") (neotree-make-executor
                                                         :file-fn 'neo-open-file
                                                         :dir-fn  'neo-open-dir))


;; window management
(defhydra hydra-windows-menu nil
  "wins"
  ("s" select-window-0 "0")
  ("t" select-window-1 "1")
  ("n" select-window-2 "2")
  ("e" select-window-3 "3"))
(evil-leader/set-key
  "m"  'hydra-projectile-menu/body)
