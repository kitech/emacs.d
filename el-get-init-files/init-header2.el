
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
      "Copyright (C) 2007-2015 liuguangzhao@users.sf.net\n")

(setq header-date-format "%Y-%m-%d %T %z")
(make-local-variable 'user-full-name) 
(make-local-variable 'user-mail-address)
(make-local-variable 'user-homepage)


(provide 'init-header2)
