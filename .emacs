;;; .emacs --- 
;; 
;; Author: liuguangzhao
;; Copyright (C) 2007-2013 liuguangzhao@users.sf.net
;; URL: http://www.qtchina.net http://nullget.sourceforge.net
;; Created: 2009-08-29 17:25:22 +0800
;; Version: $Id: .emacs 1163 2014-06-03 03:10:16Z drswinghead $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *ec-root* "~/emacs.d")
(defvar *emacs-site-lisp* "/usr/share/emacs/site-lisp")

(add-to-list 'load-path (concat *ec-root* "/elisp"))
(add-to-list 'load-path (concat *ec-root* "/elisp/muse"))
(add-to-list 'load-path (concat *ec-root* "/elisp/ecb"))
(add-to-list 'load-path (concat *emacs-site-lisp* "/ecb"))
(add-to-list 'load-path (concat *emacs-site-lisp* "/cedet"))


(add-to-list 'load-path (concat *ec-root* "/elisp/yasnippet"))
(require 'yasnippet) ;; not yasnippet-bundle
(require 'yasnippet-debug)

;; ;(setq yas/snippet-dirs ((concat *ec-root* "/elisp/mysnippets")
;; ;			(concat *ec-root* "/elisp/yas-extras/imported")))
(setq yas-snippet-dirs (list ; "~/.emacs.d/snippets"
                              ; "~/.emacs.d/plugins/yasnippet/extras/imported"
                              (concat *ec-root* "/elisp/yasnippet/snippets")
                              (concat *ec-root* "/elisp/mysnippets")
                              (concat *ec-root* "/elisp/yas-extras/imported")
                              ))
;(yas/global-mode 1)
(yas-global-mode 1)
;(yas/initialize)
; (yas/load-directory (concat *ec-root* "/elisp/snippets"))
(load (concat *ec-root* "/elisp/gzleo.el"))
;(load (concat *ec-root* "/elisp/mweb-example-config.el"))
;web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.thtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))


;; (setq cedet_el (concat *emacs-site-lisp* "/cedet/common/cedet.el"))
;; (if (not (file-exists-p cedet_el))
;;     (setq cedet_el (concat *ec-root* "/elisp/cedet/common/cedet.el")))
;; (if
;;     (file-exists-p cedet_el)
;;     (list ;; (load cedet_el)
;;           (global-ede-mode 1)
;;           ;; (semantic-load-enable-minimum-features)
;;           ;; (semantic-load-enable-code-helpers) ;; 目前这一行导致emacs死锁, CPU 100%
;;           ;; (semantic-load-enable-gaudy-code-helpers)
;;           ;; (semantic-load-enable-all-exuberent-ctags-support)
;;           ;; (global-srecode-minor-mode 1)
;; 	  (+ 1 2)
;; 	)
;;   )

(setq stack-trace-on-error t) ; for ecb & emacs24 problem
;; 查找安装在系统中的ecb
(if (file-exists-p (concat *emacs-site-lisp* "/ecb/ecb.el"))
    (list (load (concat *emacs-site-lisp* "/ecb/ecb.el"))
          (require 'ecb)))

;; 查找用户目录下的ecb
(if (file-exists-p (concat *ec-root*  "/elisp/ecb/ecb.el"))
    (list (load (concat *ec-root*  "/elisp/ecb/ecb.el"))
          (require 'ecb)))

;; 多重选取/编辑特性，重构代码，批量变量改名
(add-to-list 'load-path (concat *ec-root* "/elisp/multiple-cursors"))
(load (concat *ec-root* "/elisp/multiple-cursors/multiple-cursors.el"))

;; 这个没有svn信息，缺少不少信息的显示。
;; (load (concat *ec-root*  "/elisp/tiny-powerline.el"))
;;;;; a nice powerline
;; (require 'powerline)
;; (load (concat *ec-root*  "/elisp/powerline.el"))

;; load cscope 
;; (require 'xcscope)
(add-hook 'c-mode-common-hook
          '(lambda()
             (require 'xcscope)))

;;设置TAB宽度为4 
(setq-default indent-tabs-mode  nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-offset 4)
(setq truncate-partial-width-windows t)

;; Base setting
(defalias 'yes-or-no-p 'y-or-n-p)
(set-background-color "#CDE8D0")


;; (print (not window-system))
(print (equal window-system nil))
;; (if (not (eq window-system nil))
;;     (progn 
;;       (print "Leo setting hide toolbar.")
;;       (tool-bar-mode nil)
;;       (toggle-tool-bar-mode-from-frame nil)))
;; (if (not (eq window-system nil))
;;     (progn
;;       (print "Leo setting hide scrollbar.")
;;       (scroll-bar-mode nil)
;;       (toggle-scroll-bar nil)))
;; (if (not (eq window-system nil))
;;     (progn
;;       (print "Leo setting hide menubar.")
;;       (menu-bar-mode nil)
;;       (toggle-menu-bar-mode-from-frame nil)))
;; (if window-system 
;;     (progn 
;;       (print "Leo setting emacs frame size: 128x55")
;;       (set-frame-width (selected-frame) 128) 
;;       (set-frame-height (selected-frame) 55))
;;   )
(if (equal window-system nil)
    (print "Console mode")
    (progn
      (toggle-tool-bar-mode-from-frame nil)
      (print "UI bar's mode.")
      (tool-bar-mode nil)
      ))

(if (not (equal window-system nil))
    (progn
      ;(scroll-bar-mode nil)
      (toggle-scroll-bar nil)

      ;(menu-bar-mode nil)
      (toggle-menu-bar-mode-from-frame nil)

      (print "Leo setting emacs frame size: 128x55")
      (set-frame-width (selected-frame) 128) 
      (set-frame-height (selected-frame) 55)     
      ))

(if window-system 
    (progn 
      (print "M-w to both X clipboard and king ring")
      (setq x-select-enable-clipboard t)
      ))


(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; (setq hl-line-mode t)
(hl-line-mode t)

(setq display-time-24hr-format t)
(display-time) ;; 显示 24 小时制时间
(column-number-mode t)
;;(setq default-fill-column 88)
;; no use, why?
;; (setq default-frame-alist 
;;       '((height . 75) (width . 88) (menu-bar-lines . 20) (tool-bar-lines . 0)))
;; or put this in ~/.Xdefaults, but also no use:
;; Emacs.geometry: 88x65+0+-2
;; 

;; PHP 语法高亮
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php[s34]?\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; go lang
(require `go-mode-load)

;; file header
(setq user-full-name "liuguangzhao") 
(setq user-mail-address "liuguangzhao@users.sf.net") 
(setq user-homepage "http://www.qtchina.tk http://nullget.sourceforge.net")
(require 'header2)
(setq make-header-hook '(header-title
                         header-blank
                         header-author
                         header-copyright
                         header-url
                         header-creation-date
                         header-rcs-id
                         header-end-line
                         ))
(setq header-copyright-notice 
      "Copyright (C) 2007-2014 liuguangzhao@users.sf.net\n")
(setq header-date-format "%Y-%m-%d %T %z")
(make-local-variable 'user-full-name) 
(make-local-variable 'user-mail-address)
(make-local-variable 'user-homepage)

;; 2014-08-13
(load (concat *ec-root* "/elisp/auto-complete-config.el"))
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/emacs.d/clang-complete")
;  (if (string-match (shell-command-to-string "/usr/bin/uname -m") "i686\n")
;      (setq ac-clang-complete-executable "~/emacs.d/clang-complete32")
;    (setq ac-clang-complete-executable "~/emacs.d/clang-complete"))
  (message ac-clang-complete-executable)

  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (setq ac-auto-show-menu 1)
  (global-auto-complete-mode t))

;; ac flag, paths
;; 这个没有用吗？需要注释一行：;;(make-variable-buffer-local 'ac-clang-cflags)
(setq ac-clang-cflags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
/usr/include
/usr/include/qt/
/usr/include/qt/QtCore
/usr/include/qt/QtGui
/usr/include/qt/QtWidgets
/usr/include/qt/QtNetwork
"
               )))


;; (ac-clang-syntax-check)

(my-ac-config)


(require 'auto-complete-extension)
(require 'autocompletion-php-functions)
(global-auto-complete-mode t)

;; Completion by return
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" 'ac-complete)

;; Use C-n/C-p to select candidates
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\M-/" 'ac-stop)
(global-set-key "\M-/" 'ac-start)

(setq-default ac-sources '(ac-source-abbrev ac-source-words-in-buffer ac-source-c++))

;;
(if (not (eq window-system nil))
    (set-fringe-mode 0))

;; flymake-mode
(setq temporary-file-directory "/tmp/")
(require 'flymake)
(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))


(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

(require 'qt-pro)
(add-to-list 'auto-mode-alist '("\\.pr[io]$" . qt-pro-mode))

(require 'qml-mode)
(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

;; load highlight-tail, sexy modify progress
(require 'highlight-tail)
(highlight-tail-mode t)
(require 'util)
(require 'ahei-misc)
(require 'mode-line-face-settings)
(require 'mode-line-settings)

(require 'pkgbuild-mode)

;;加载muse-mode
(require 'muse-mode)
(require 'muse-html)
(require 'muse-wiki)
(add-to-list 'auto-mode-alist '("\\.muse$" . muse-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;; asterisk extension language mode, ael-mode
(require 'ael-mode)

;;
(require 'saveplace)
(setq-default save-place t)

(require 'hexview-mode)
(load "duplicate-line.el")
(global-set-key "\M-p" 'duplicate-previous-line)
(global-set-key "\M-n" 'duplicate-following-line)

(require 'textmate)
(textmate-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/home/gzleo/emacs.d"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((default :inherit mode-line) (((type tty)) :foreground "black" :background "yellow" :inverse-video nil) (((class color grayscale) (background light)) :background "grey90" :foreground "grey20" :box nil) (((class color grayscale) (background dark)) :background "#D58EFFFFFC18" :foreground "blue") (((class mono) (background light)) :background "white" :foreground "black" :inverse-video nil :box nil :underline t) (((class mono) (background dark)) :background "black" :foreground "white" :inverse-video nil :box nil :underline t)))
 '(mode-line-buffer-id ((((class grayscale) (background light)) (:foreground "LightGray" :background "yellow" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :background "yellow" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 88) (background dark)) (:foreground "yellow" :background "HotPink3")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue" :background "yellow")) (((class color) (min-colors 8)) (:foreground "blue" :background "yellow" :weight bold)) (t (:weight bold)))))


(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; last step 
;; (server-mode)
(run-with-idle-timer 1.5 nil 'server-mode)
;; (ecb-activate)
(run-with-idle-timer 0.5 nil 'ecb-activate)

;; simple window manager
;; winner-mode 
;; winner-undo

; (require 'linum)
; (setq linum-format (concat linum-format "  "))
; (setq linum-format "%d  ") ; (setq width (max width (+ (length str) 1)))
; (setq linum-format "%4d \u2502 ")
