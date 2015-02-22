;; 使用el-get和package.el包管理的方式
;; 目录结构：
;; ~/emacs.d/
;;├── el-get
;;├── el-get-init-files
;;├── elpa
;;├── .emacs
;;├── handby
;;├── init.el
;;├── restore.el  ;;换机器的时候使用
;;└── README.txt

;; 对于elpa目录和el-get目录和handby目录，使用目录列表加入到load-path中。
(defvar *elroot* (expand-file-name "~/emacs.d"))
;;(add-to-list 'load-path (concat *elroot* "/handby"))
(defvar el-get-dir (expand-file-name "~/emacs.d/el-get/"))
(defvar el-get-user-package-directory (concat *elroot* "/el-get-init-files"))

;; 
(defun add-load-path (e bpath)
  (if (and (not (equal e ".")) (not (equal e ".."))
  	   (not (equal e ".git"))
  	   (file-directory-p (concat bpath "/" e)))
      (progn (message (concat "ccc/" e))
  	     (add-to-list 'load-path (concat bpath "/" e))
  	     )
    )
  )

(defun add-entries (path)
  (mapcar (lambda (e)
	    (add-load-path e path))
	  (directory-files (concat path "")))
  )
;;
;; (mapcar (lambda (e)
;; 	  (add-load-path e *elroot*))
;;         (directory-files (concat *elroot* "")))
;; (mapcar 'add-load-path
;;        (directory-files (concat *elroot* "")))
(add-entries (concat *elroot* ""))
(add-entries (concat *elroot* "/el-get"))
(add-entries (concat *elroot* "/handby"))
(add-entries (concat *elroot* "/elpa"))

(require 'package)
(require 'el-get)
(require 'init-company-mode)
(require 'init-yasnippet)
(require 'init-ecb)

;;(require 'ruby-mode)
(require 'php-mode)
(require 'go-mode)
(require 'scala-mode2)
(require 'sbt-mode)
(require 'idle-highlight-mode)
(load (concat *elroot* "/handby/request-deferred.el"))
(require 'request-deferred)
(require 'company-ycmd)

(provide 'init)
