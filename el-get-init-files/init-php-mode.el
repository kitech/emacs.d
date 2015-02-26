
;; PHP 语法高亮
(require 'php-mode)
(require 'company-php-session-backend)
(setq cpsb/boris-program "/usr/bin/boris")
;; (add-to-list 'company-backends 'company-php-session-backend)

(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php[s345]?\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

(require 'company)
(defun my-php-yac ()
  (add-to-list 'company-backends 'company-my-php-yac-backend))
(add-hook 'php-mode-hook 'my-php-yac)


(defvar **comphash** (make-hash-table :test 'equal))
(defun mrg-ycmd-and-helper (h)
  (maphash (lambda (k v)
            (remhash k **comphash**)
            (puthash k v **comphash**)
            )
          h)
  
  (deferred:$
    (ycmd-get-completions (current-buffer) (point))
    (deferred:nextc it
      (lambda (completions)

        (mapcar (lambda (x)
                  (remhash (cdar x) **comphash**)
                  (puthash (cdar x) t **comphash**)
                  )
                (cdr (cadr completions)))
        "hehe"))
    )

  **comphash**
  )

(defun company-my-php-yac-backend (command &optional arg &rest ignored)
  (case command
    (prefix (and (eq major-mode 'php-mode)
                 (company-grab-symbol)))
    (sorted t)
    (candidates
     (all-completions  arg
      (if (and (boundp 'my-php-symbol-hash)
               my-php-symbol-hash)
          ;; my-php-symbol-hash
          ;; (company-ycmd command arg ignored)
          (mrg-ycmd-and-helper my-php-symbol-hash)
        
        (with-temp-buffer
          (call-process-shell-command
           ;; "php -r '$all=get_defined_functions();foreach ($all[\"internal\"] as $fun) { echo $fun . \";\";};'"
           ;; "php /home/gzleo/emacs.d/php_complete_helper.php"
           (concat "php " *elroot* "/misc/php_complete_helper.php")
           nil t)
          (goto-char (point-min))
          (let ((hash (make-hash-table)))
            (while (re-search-forward "\\([^;]+\\);" (point-max) t)
              (puthash (match-string 1) t hash))
            (setq my-php-symbol-hash hash))))))
    (meta (format "This value is named %s" arg))))

;;(ycmd-get-completions (list 'abc) )

(defun test_pc ()
  (with-temp-buffer
    (call-process-shell-command
     ;; "php -r '$all=get_defined_functions();foreach ($all[\"internal\"] as $fun) { echo $fun . \";\";};'"     
     (concat "php " *elroot* "/misc/php_complete_helper.php")
     nil t)
    (goto-char (point-min))
    (let ((tmphash (make-hash-table)))
      (while (re-search-forward "\\([^;]+\\);" (point-max) t)
        (puthash (match-string 1) t tmphash))
      (setq my-php-symbol-hash tmphash)))
  )
;;(test_pc)

;; (call-process-shell-command
;;  "php -r '$all=get_defined_functions();foreach ($all[\"internal\"] as $fun) { echo $fun . \";\";};'"
;;  nil t)


(provide 'init-php-mode)
