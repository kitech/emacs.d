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
;; (if (file-exists-p (concat *emacs-site-lisp* "/ecb/ecb.el"))
;;     (list (load (concat *emacs-site-lisp* "/ecb/ecb.el"))
;;           (require 'ecb)))

;; 查找用户目录下的ecb
;; (if (file-exists-p (concat *ec-root*  "/elisp/ecb/ecb.el"))
;;     (list (load (concat *ec-root*  "/elisp/ecb/ecb.el"))
;;           (require 'ecb)))

(require 'ecb)

;; 这是ecb-store-window-sizes函数自动添加的
;; 记录ecb的窗口状态
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes
   (quote
    (("left8"
      (ecb-directories-buffer-name 0.13043478260869565 . 0.2857142857142857)
      (ecb-sources-buffer-name 0.13043478260869565 . 0.22448979591836735)
      (ecb-methods-buffer-name 0.13043478260869565 . 0.2857142857142857)
      (ecb-history-buffer-name 0.13043478260869565 . 0.1836734693877551)))))
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/home/gzleo/emacs.d"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((default :inherit mode-line) (((type tty)) :foreground "black" :background "yellow" :inverse-video nil) (((class color grayscale) (background light)) :background "grey90" :foreground "grey20" :box nil) (((class color grayscale) (background dark)) :background "#D58EFFFFFC18" :foreground "blue") (((class mono) (background light)) :background "white" :foreground "black" :inverse-video nil :box nil :underline t) (((class mono) (background dark)) :background "black" :foreground "white" :inverse-video nil :box nil :underline t)))
 '(mode-line-buffer-id ((((class grayscale) (background light)) (:foreground "LightGray" :background "yellow" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :background "yellow" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 88) (background dark)) (:foreground "yellow" :background "HotPink3")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue" :background "yellow")) (((class color) (min-colors 8)) (:foreground "blue" :background "yellow" :weight bold)) (t (:weight bold)))))

(provide 'init-ecb)

