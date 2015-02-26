

(set-variable 'ycmd-global-config (concat *elroot* "/misc/ycm_extra_conf.py"))
(set-variable 'ycmd-server-command '("python2" "/home/gzleo/opensource/ycmd/ycmd"))
(require 'ycmd)
(ycmd-setup)
(ycmd-toggle-force-semantic-completion)

(require 'company)
(require 'company-ycmd)
(company-ycmd-setup)



;(add-to-list 'load-path (concat *ec-root* "/elisp/emacs-ycmd"))
;(set-variable 'ycmd-global-config "/path/to/global_config.py")
;(set-variable 'ycmd-server-command '("python2" "/home/gzleo/opensource/ycmd/ycmd"))
;(require 'ycmd)
;(ycmd-setup)
;(add-to-list 'load-path (concat *ec-root* "/elisp/company-mode"))
;(require 'company)
;(require 'company-ycmd)
;(company-ycmd-setup)




(provide 'init-emacs-ycmd)
