;;; .emacs --- 
;; 
;; Author: liuguangzhao
;; Copyright (C) 2007-2015 liuguangzhao@users.sf.net
;; URL: http://www.qtchina.net http://nullget.sourceforge.net
;; Created: 2009-08-29 17:25:22 +0800
;; Version: $Id: .emacs 1163 2014-06-03 03:10:16Z drswinghead $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;

;;;; auto load packages
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get"))
;; (defvar el-get-dir (expand-file-name "~/emacs.d/el-get/"))
(require 'el-get)
;;(el-get 'sync)
(load "~/.emacs.d/init.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
(setq ruby-indent-level 4)


;; Base setting
(defalias 'yes-or-no-p 'y-or-n-p)
(set-background-color "#CCE8CF")
;; 十六进制颜色：#C7EDCC或用#CCE8CF
;; #CDE8D0

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

;; simple window manager
;; winner-mode 
;; winner-undo

; (require 'linum)
; (setq linum-format (concat linum-format "  "))
; (setq linum-format "%d  ") ; (setq width (max width (+ (length str) 1)))
; (setq linum-format "%4d \u2502 ")

(require 'gzleo)

;; last step 
;; (server-mode)
;;(run-with-idle-timer 1.5 nil 'server-mode)
;; (ecb-activate)
;;(run-with-idle-timer 0.5 nil 'ecb-activate)
