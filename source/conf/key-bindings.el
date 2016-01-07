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

(evil-leader/set-leader ",")
(evil-leader/set-key
 ","   'helm-M-x
 "."   'eval-buffer
 "c"   'comment-or-uncomment-region
 "d d" 'dash-at-point
 "e"   'er/expand-region
 "a"   'align-regexp
 "u"   'undo-tree-visualize
 "b"   'helm-buffers-list
 "f"   'neotree-toggle
 "p"   'helm-projectile
 "P"   'helm-find-files
 "b"   'helm-buffers-list
 "g"   'helm-projectile-ag
 "e"   'evil-ace-jump-word-mode
 "n"   'evil-ace-jump-line-mode
 "i"   'evil-ace-jump-char-mode)

;; neotree
(evil-declare-key 'normal neotree-mode-map (kbd  "RET") (neotree-make-executor
                                                          :file-fn 'neo-open-file
                                                          :dir-fn  'neo-open-dir))
(evil-declare-key 'normal neotree-mode-map (kbd  "k") 'neotree-previous-line)
(evil-declare-key 'normal neotree-mode-map (kbd  "j") 'neotree-next-line)
(evil-declare-key 'normal neotree-mode-map (kbd  "m a") 'neotree-create-node)
(evil-declare-key 'normal neotree-mode-map (kbd  "m r") 'neotree-rename-node)
(evil-declare-key 'normal neotree-mode-map (kbd  "m c") 'neotree-copy-node)
(evil-declare-key 'normal neotree-mode-map (kbd  "m d") 'neotree-delete-node)

(global-set-key (kbd "C-k") (lambda () (interactive) (evil-previous-line 10)))
(global-set-key (kbd "C-j") (lambda () (interactive) (evil-next-line 10)))

(defhydra hydra-smartparens-menu nil
  "sp"
  ("n" sp-forward-slurp-sexp "slrp")
  ("t" sp-forward-barf-sexp "brf")
  ("s" sp-backward-slurp-sexp "b-slrp")
  ("e" sp-backward-barf-sexp "b-brf")

  ("g" sp-select-pervious-thing-exchange "sel")
  ("l" sp-select-next-thing-exchange "b-sel")

  ("k" sp-kill-sexp "kill"))

(evil-leader/set-key
 "s"   'hydra-smartparens-menu/body)

(defhydra hydra-textop-menu nil
  "mv"
  ("k" move-text-up "up")
  ("j" move-text-down "down")
  ("s" transpose-sexps "sexp"))

(evil-leader/set-key
 "m"   'hydra-textop-menu/body)

(defhydra hydra-modes-menu nil
  "modes"
  ("v" vline-mode "vline")
  ("h" hl-line-mode "hline"))

(evil-leader/set-key
 "q"   'hydra-modes-menu/body)

(defhydra hydra-magit-menu nil
  "modes"
  ("s" magit-status "status"))

(evil-leader/set-key
 "v"   'hydra-magit-menu/body)


;; Company

(define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
