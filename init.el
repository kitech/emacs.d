;; 使用el-get和package.el包管理的方式
;; 目录结构：
;; ~/emacs.d/
;;├── el-get
;;├── el-get-init-files
;;├── el-get-recipes
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
(add-to-list 'el-get-recipe-path (concat *elroot* "/el-get-recipes"))
(require 'init-company-mode)
(require 'init-emacs-ycmd)
(require 'init-yasnippet)
(require 'init-ecb)
(require 'init-header2)
(require 'init-markdown-mode)
(require 'init-cmake-mode)
(require 'init-php-mode)
(require 'init-yafolding)

;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;
(require 'highline) (global-highline-mode t)
(require 'ruby-mode)
(require 'pkgbuild-mode)

 ;; go lang
(require 'go-mode) (require `go-mode-load)


(require 'scala-mode2)
(require 'sbt-mode)
(require 'idle-highlight-mode)
(load (concat *elroot* "/handby/request-deferred.el"))
(require 'request-deferred)
(require 'js2-mode)
(require 'nginx-mode)
(require 'protobuf-mode)
(require 'llvm-mode)
(require 'qmake-mode)
(add-to-list 'auto-mode-alist '("\\.pr[io]$" . qmake-mode))

(require 'qml-mode)
(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

(require 'textmate) (textmate-mode)

;;;;;;;;;;;;;;;;;;;;;;;
(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-common-hook
               'cc-mode-hook
               'c++-mode-hook
;;               'php-mode-hook
               'ruby-mode-hook
               'python-mode-hook
               'go-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook))
  (add-hook hook 'company-mode))

;; (dolist (hook2 (list
;;                 'php-mode-hook
;;                 'c++-mode-hook))
;;   (add-hook hook2 'ycmd-mode))

(provide 'init)
