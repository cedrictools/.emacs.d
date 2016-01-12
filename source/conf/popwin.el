
;; TODO: configure properly
;; see https://github.com/m2ym/popwin-el/blob/master/popwin.el

;;;; see http://www.emacswiki.org/emacs/NeoTree#toc8
;;(when neo-persist-show
;;  (add-hook 'popwin:before-popup-hook
;;            (lambda  ()  (setq neo-persist-show nil)))
;;  (add-hook 'popwin:after-popup-hook
;;            (lambda  ()  (setq neo-persist-show t))))

(add-to-list 'display-buffer-alist
             `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.4)))

;; don't use default value but manage it ourselves
(setq popwin:special-display-config nil)

(popwin-mode 1)

;; buffers that we manage
;;(push '("^\*helm.*\*$" :regexp 1) popwin:special-display-config)
(push  "^*Kill Ring*$" popwin:special-display-config)
(push '("*Help*"                 :dedicated t :position bottom :stick t :noselect t :height 0.4) popwin:special-display-config)
(push '("*compilation*"          :dedicated t :position bottom :stick t :noselect t :height 0.4) popwin:special-display-config)
(push '("*Shell Command Output*" :dedicated t :position bottom :stick t :noselect t            ) popwin:special-display-config)
(push '("*Async Shell Command*"  :dedicated t :position bottom :stick t :noselect t            ) popwin:special-display-config)
(push '(" *undo-tree*"           :dedicated t :position bottom :stick t :noselect t :height 0.4) popwin:special-display-config)
(push '("*ert*"                  :dedicated t :position bottom :stick t :noselect t            ) popwin:special-display-config)
(push '("*grep*"                 :dedicated t :position bottom :stick t :noselect t            ) popwin:special-display-config)
(push '("*nosetests*"            :dedicated t :position bottom :stick t :noselect t            ) popwin:special-display-config)
(push '("^\*WoMan.\*$" :regexp t             :position bottom                                 ) popwin:special-display-config)
