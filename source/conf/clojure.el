(add-to-list
 'dash-at-point-mode-alist
 '(clojure-mode . "clojure"))

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(setq cider-boot-parameters "cider dev repl -s wait")
(setq clojure-docstring-fill-prefix-width 3)

(setq clojure-indent-style :always-indent)

(define-clojure-indent
   ;; built-ins
   (ns :defn)
   (fn :defn)
   (def :defn)
   (defn :defn)
   (bound-fn :defn)
   (if :defn)
   (if-not :defn)
   (case :defn)
   (cond 0)
   (condp 2)
   (cond-> :defn)
   (cond->> :defn)
   (when :defn)
   (while :defn)
   (when-not :defn)
   (when-first :defn)
   (do 0)
   (future 0)
   (comment 0)
   (doto 1)
   (locking 1)
   (proxy :defn)
   (as-> 2)

   (reify :defn)
   (deftype :defn)
   (defrecord :defn)
   (defprotocol :defn)
   (extend 1)
   (extend-protocol :defn)
   (extend-type :defn)
   ;; specify and specify! are from ClojureScript
   (specify :defn)
   (specify! :defn)
   (try 0)
   (catch 2)
   (finally 0)

   ;; binding forms
   (let :defn)
   (letfn :defn)
   (binding :defn)
   (loop :defn)
   (for :defn)
   (doseq :defn)
   (dotimes :defn)
   (when-let :defn)
   (if-let :defn)
   (when-some :defn)
   (if-some :defn)
   (this-as :defn) ; ClojureScript

   (defmethod :defn)

   ;; clojure.test
   (testing :defn)
   (deftest :defn)
   (are :defn)
   (use-fixtures :defn)

   ;; core.logic
   (run :defn)
   (run* :defn)
   (fresh :defn)

   ;; core.async
   (alt! :defn)
   (alt!! :defn)
   (go :defn)
   (go-loop :defn)
   (thread :defn))
