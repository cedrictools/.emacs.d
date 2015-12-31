
(require 'popwin)
(popwin-mode 1)

;; TODO: configure properly
;; see https://github.com/m2ym/popwin-el/blob/master/popwin.el

(push '("*helm .*" :regexp 1) popwin:special-display-config)
(push  "*Kill Ring*" popwin:special-display-config)
