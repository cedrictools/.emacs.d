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
 "f"   'direx-project:jump-to-project-root
 "p"   'helm-projectile
 "P"   'helm-find-files
 "g"   'helm-do-grep-ag
 "v g" 'magit-status
 "e"   'evil-ace-jump-word-mode
 "n"   'evil-ace-jump-line-mode
 "i"   'evil-ace-jump-char-mode)

;; direx
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "RET") 'direx:maybe-find-item)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "r")   'direx:refresh-whole-tree)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "o")   'direx:find-item-other-window)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "O")   'direx:view-item-other-window)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "D")   'direx:do-delete-files)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "R")   'direx:do-rename-files)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "C")   'direx:do-touch)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "s")   'direx-grep:grep-item-from-root)
(evil-declare-key 'normal direx:direx-mode-map  (kbd  "S")   'direx-grep:show-all-item)

(global-set-key (kbd "C-k") (lambda () (interactive) (evil-previous-line 10)))
(global-set-key (kbd "C-j") (lambda () (interactive) (evil-next-line 10)))


