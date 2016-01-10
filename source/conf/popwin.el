
(popwin-mode 1)

;; TODO: configure properly
;; see https://github.com/m2ym/popwin-el/blob/master/popwin.el

(push '("\*helm.*\*" :regexp 1) popwin:special-display-config)
(push  "*Kill Ring*" popwin:special-display-config)


;; see http://www.emacswiki.org/emacs/NeoTree#toc8
;;(when neo-persist-show
;;  (add-hook 'popwin:before-popup-hook
;;            (lambda  ()  (setq neo-persist-show nil)))
;;  (add-hook 'popwin:after-popup-hook
;;            (lambda  ()  (setq neo-persist-show t))))
