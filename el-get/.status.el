((anaphora status "installed" recipe
           (:name anaphora :description "Anaphoric expressions for Emacs Lisp, providing implicit temporary variables" :type github :website "https://github.com/rolandwalker/anaphora" :pkgname "rolandwalker/anaphora"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))))
 (bookmark+ status "installed" recipe
            (:name bookmark+ :pkgname "emacsmirror/bookmark-plus" :website "http://www.emacswiki.org/emacs/BookmarkPlus" :type github :description "Extensions to standard library `bookmark.el'"))
 (cedet status "installed" recipe
        (:name cedet :website "http://cedet.sourceforge.net/" :description "CEDET is a Collection of Emacs Development Environment Tools written with the end goal of creating an advanced development environment in Emacs." :type git :url "http://git.code.sf.net/p/cedet/git" :build
               `(("sh" "-c" "touch `find . -name Makefile`")
                 ("make" ,(format "EMACS=%s"
                                  (shell-quote-argument el-get-emacs))
                  "clean-all")
                 ("make" ,(format "EMACS=%s"
                                  (shell-quote-argument el-get-emacs)))
                 ("make" ,(format "EMACS=%s"
                                  (shell-quote-argument el-get-emacs))
                  "-C" "contrib"))
               :build/berkeley-unix
               `(("sh" "-c" "touch `find . -name Makefile`")
                 ("gmake" ,(format "EMACS=%s"
                                   (shell-quote-argument el-get-emacs))
                  "clean-all")
                 ("gmake" ,(format "EMACS=%s"
                                   (shell-quote-argument el-get-emacs)))
                 ("gmake" ,(format "EMACS=%s"
                                   (shell-quote-argument el-get-emacs))
                  "-C" "contrib"))
               :build/windows-nt
               ("echo #!/bin/sh > tmp.sh & echo touch `/usr/bin/find . -name Makefile` >> tmp.sh & echo make FIND=/usr/bin/find >> tmp.sh" "sed 's/^M$//' tmp.sh  > tmp2.sh" "sh ./tmp2.sh" "rm ./tmp.sh ./tmp2.sh")
               :features nil :lazy nil :post-init
               (if
                   (or
                    (featurep 'cedet-devel-load)
                    (featurep 'eieio))
                   (message
                    (concat "Emacs' built-in CEDET has already been loaded!  Restart" " Emacs to load CEDET from el-get instead."))
                 (load
                  (expand-file-name "cedet-devel-load.el" pdir)))))
 (clang-complete-async status "installed" recipe
                       (:name clang-complete-async :website "https://github.com/Golevka/emacs-clang-complete-async" :description "An emacs extension to complete C and C++ code using libclang." :type github :pkgname "Golevka/emacs-clang-complete-async" :build
                              '(("make"))
                              :depends auto-complete :features auto-complete-clang-async :prepare
                              (setq ac-clang-complete-executable
                                    (expand-file-name
                                     (concat
                                      (el-get-package-directory "clang-complete-async")
                                      "clang-complete")))))
 (cmake-mode status "installed" recipe
             (:name cmake-mode :website "http://www.itk.org/Wiki/CMake/Editors/Emacs" :description "Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake source files." :type http :url "http://cmake.org/gitweb?p=cmake.git;a=blob_plain;hb=master;f=Auxiliary/cmake-mode.el"))
 (company-c-headers status "installed" recipe
                    (:name company-c-headers :description "Company mode backend for C/C++ header files." :type github :pkgname "randomphrase/company-c-headers" :depends
                           (company-mode)))
 (company-inf-ruby status "installed" recipe
                   (:name company-inf-ruby :description "Completion back-end for inf-ruby" :type github :pkgname "company-mode/company-inf-ruby" :depends
                          (inf-ruby company-mode)))
 (company-mode status "installed" recipe
               (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (company-php status "installed" recipe
              (:name company-php :description "Use a boris comint process to provide completion candidates for php. " :type github :pkgname "tomterl/company-php-session-backend"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (ecb status "required" recipe nil)
 (el-get status "required" recipe nil)
 (emacs-ycmd status "installed" recipe
             (:name emacs-ycmd :description "emacs bindings to the ycmd completion server." :website "https://github.com/abingham/emacs-ycmd" :type github :depends
                    (anaphora request deferred popup)
                    :pkgname "abingham/emacs-ycmd"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (flymake status "installed" recipe
          (:name flymake :description "Continuous syntax checking for Emacs." :type github :pkgname "illusori/emacs-flymake"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (go-company status "required" recipe nil)
 (go-mode status "installed" recipe
          (:name go-mode :description "Major mode for the Go programming language" :type github :pkgname "dominikh/go-mode.el"))
 (header2 status "installed" recipe
          (:name header2 :description "Support for creation and update of file headers." :type emacswiki :features "header2"))
 (highline status "installed" recipe
           (:type github :pkgname "emacsmirror/highline" :name highline :description "minor mode to highlight current line in buffer" :type emacsmirror :prepare
                  (defun highline-mode-on nil "Turn on `highline-mode' mode."
                         (interactive)
                         (highline-mode 1))))
 (idle-highlight-mode status "installed" recipe
                      (:name idle-highlight-mode :description "Idle Highlight Mode." :website "https://github.com/nonsequitur/idle-highlight-mode" :type github :pkgname "nonsequitur/idle-highlight-mode"))
 (inf-ruby status "installed" recipe
           (:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
 (js2-mode status "installed" recipe
           (:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
                  (autoload 'js2-mode "js2-mode" nil t)))
 (llvm-mode status "installed" recipe
            (:name llvm-mode :description "Major mode for the LLVM assembler language." :website "http://llvm.org/" :type http :url "http://llvm.org/viewvc/llvm-project/llvm/trunk/utils/emacs/llvm-mode.el?view=co" :build
                   (("mv" "llvm-mode.el_view_co" "llvm-mode.el"))
                   :prepare
                   (progn
                     (autoload 'llvm-mode "llvm-mode" "LLVM assembler language editing mode." t)
                     (add-to-list 'auto-mode-alist
                                  '("\\.ll\\'" . llvm-mode)))))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type git :url "git://jblevins.org/git/markdown-mode.git" :prepare
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (multi-web-mode status "installed" recipe
                 (:name "multi-web-mode" :description "Multi Web Mode is a minor mode which makes web editing in Emacs much easier" :type github :pkgname "fgallina/multi-web-mode"))
 (nginx-mode status "installed" recipe
             (:name nginx-mode :website "https://github.com/ajc/nginx-mode" :description "major mode for editing nginx config files" :type github :pkgname "ajc/nginx-mode"))
 (php-mode status "installed" recipe
           (:name php-mode :description "A PHP mode for GNU Emacs " :type github :pkgname "ejmr/php-mode" :website "https://github.com/ejmr/php-mode"))
 (pkgbuild-mode status "installed" recipe
                (:name pkgbuild-mode :description "Major mode for editing PKGBUILD files" :type github :pkgname "juergenhoetzel/pkgbuild-mode" :features pkgbuild-mode :post-init
                       (add-to-list 'auto-mode-alist
                                    '("PKGBUILD$" . pkgbuild-mode))))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (protobuf-mode status "required" recipe nil)
 (qmake-mode status "required" recipe nil)
 (qml-mode status "installed" recipe
           (:name qml-mode :website "https://github.com/cataska/qml-mode" :description "Qt Declarative UI (QML) mode for Emacs" :type github :pkgname "cataska/qml-mode" :features qml-mode))
 (request status "installed" recipe
          (:name request :description "Easy HTTP request for Emacs Lisp" :type github :submodule nil :pkgname "tkf/emacs-request"))
 (ruby-mode status "installed" recipe
            (:name ruby-mode :builtin "24" :type http :description "Major mode for editing Ruby files." :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/ruby-mode.el"))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (sbt-mode status "installed" recipe
           (:name sbt-mode :description "An emacs mode for interacting with scala sbt and projects" :type github :pkgname "hvesalai/sbt-mode"))
 (scala-mode2 status "installed" recipe
              (:name scala-mode2 :description "A new scala-mode for Emacs 24." :type github :pkgname "hvesalai/scala-mode2"))
 (textmate status "installed" recipe
           (:name textmate :description "TextMate minor mode for Emacs" :type github :pkgname "defunkt/textmate.el" :features textmate :post-init
                  (textmate-mode)))
 (web-mode status "installed" recipe
           (:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
 (yafolding status "installed" recipe
            (:name yafolding :description "Yet another folding extension for Emacs" :type github :pkgname "zenozeng/yafolding.el"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
                   (("git" "submodule" "update" "--init" "--" "snippets"))))
 (yasnippet-snippets status "installed" recipe
                     (:name yasnippet-snippets :description "A collection of yasnippet snippets for many languages" :type github :pkgname "AndreaCrotti/yasnippet-snippets" :depends
                            (yasnippet)))
 (yasnippets status "installed" recipe
             (:name yasnippets :description "Comprehensive collection of yasnippets" :type github :pkgname "rejeep/yasnippets" :depends
                    (yasnippet))))
