(require 'company)
(company-mode t)
(autoload 'company-mode "company" nil t)
(define-key company-mode-map "\t" nil)
;; (define-key company-mode-map [(tab)] 'company-complete-common)
;; ;; Completion by return
;; (define-key ac-complete-mode-map "\t" 'ac-complete)
;; (define-key ac-complete-mode-map "\r" 'ac-complete)

;; ;; Use C-n/C-p to select candidates
;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)
;; (define-key ac-complete-mode-map "\M-/" 'ac-stop)
(global-set-key "\M-/" 'company-complete-common)

(message "company-mode loaded")
(provide 'init-company-mode)
