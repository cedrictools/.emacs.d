(evil-mode 1)
;;(display-time-mode f)
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)

;; mode local binding
;; (evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)
(lexical-let
  ((default-color (cons (face-background 'mode-line)
                        (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
            (lambda ()
              (let ((color (cond ((minibufferp) default-color)
                                 ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                                 ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                 ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                 (t default-color))))
                (set-face-background 'mode-line (car color))
                (set-face-foreground 'mode-line (cdr color))))))

;; Initial states for some modes

(remove-duplicates
  (nconc
    evil-emacs-state-modes
    '(magit-log-edit-mode
       nav-mode
       cider-repl-mode
       grep-mode
       ibuffer-mode)))

(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)


;; http://emacs.stackexchange.com/questions/14929/how-do-i-set-cursor-colours-per-evil-state-in-the-non-gui-text-terminal
(defun evil-set-cursor-including-terminal (orig-fn specs)
  (if (display-graphic-p)
      (funcall orig-fn specs)
    (when (= (display-color-cells) 256) ; otherwise messes up tmux under xfce4-terminal
      (pcase specs
        ((and (or `(,colour) `(,colour . ,shape))
              (guard (stringp colour)))
         (send-string-to-terminal (concat "\033]12;" colour "\007")))))))
(advice-add #'evil-set-cursor :around #'evil-set-cursor-including-terminal)

(setq evil-default-cursor '("red" box))
(setq evil-replace-state-cursor '("red" box))
(setq evil-emacs-state-cursor '(box "gray"))
(setq evil-normal-state-cursor '(box "green"))
(setq evil-visual-state-cursor '(box "orange"))
(setq evil-insert-state-cursor '(box "red"))
(setq evil-replace-state-cursor '(bar "red"))
(setq evil-operator-state-cursor '(hollow "red"))
