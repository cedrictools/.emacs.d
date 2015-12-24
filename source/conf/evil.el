
(require 'evil)
(require 'evil-leader)

(evil-mode 1)

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
                (set-face-foreground 'mode-line (cdr color))))))(provide 'memacs-evil)

;; Initial states for some modes

(remove-duplicates
  (nconc
    evil-emacs-state-modes
    '(magit-log-edit-mode
       nav-mode
       cider-repl-mode
       grep-mode
       ibuffer-mode)))


