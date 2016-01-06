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
 "g"   'helm-do-grep-ag
 "v g" 'magit-status
 "e"   'evil-ace-jump-word-mode
 "n"   'evil-ace-jump-line-mode
 "i"   'evil-ace-jump-char-mode)

;; direx
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

(defhydra hydra-buffer-menu nil
  "sp:"
  ("n" sp-forward-slurp-sexp "f-slurp")
  ("t" sp-backward-slurp-sexp "b-slurp")
  ("e" sp-forward-barf-sexp "f-barf")
  ("s" sp-backward-barf-sexp "b-barf")

  ("k" sp-kill-sexp))

(evil-leader/set-key
 "s"   'hydra-buffer-menu/body)
