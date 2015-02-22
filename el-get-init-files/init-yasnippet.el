(require 'yasnippet)
(yas-global-mode 1)
(message "yas mode loaded")


;; (add-to-list 'load-path (concat *ec-root* "/elisp/yasnippet"))
;; (require 'yasnippet) ;; not yasnippet-bundle
;; (require 'yasnippet-debug)

;; ;; ;(setq yas/snippet-dirs ((concat *ec-root* "/elisp/mysnippets")
;; ;; ;			(concat *ec-root* "/elisp/yas-extras/imported")))
;; (setq yas-snippet-dirs (list ; "~/.emacs.d/snippets"
;;                               ; "~/.emacs.d/plugins/yasnippet/extras/imported"
;;                               (concat *ec-root* "/elisp/yasnippet/snippets")
;;                               (concat *ec-root* "/elisp/mysnippets")
;;                               (concat *ec-root* "/elisp/yas-extras/imported")
;;                               ))
;; ;(yas/global-mode 1)
;; (yas-global-mode 1)
;; ;(yas/initialize)
;; ; (yas/load-directory (concat *ec-root* "/elisp/snippets"))

(provide 'init-yasnippet)

