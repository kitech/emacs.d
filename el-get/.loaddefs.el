;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "anaphora/anaphora" "anaphora/anaphora.el"
;;;;;;  (21735 16557 519915 303000))
;;; Generated autoloads from anaphora/anaphora.el

(let ((loads (get 'anaphora 'custom-loads))) (if (member '"anaphora/anaphora" loads) nil (put 'anaphora 'custom-loads (cons '"anaphora/anaphora" loads))))

(defvar anaphora-use-long-names-only nil "\
Use only long names such as `anaphoric-if' instead of traditional `aif'.")

(custom-autoload 'anaphora-use-long-names-only "anaphora/anaphora" t)

(defun anaphora--install-traditional-aliases (&optional arg) "\
Install traditional short aliases for anaphoric macros.

With negative numeric ARG, remove traditional aliases." (let ((syms (quote ((if . t) (prog1 . t) (prog2 . t) (when . when) (while . t) (and . t) (cond . cond) (lambda . lambda) (block . block) (case . case) (ecase . ecase) (typecase . typecase) (etypecase . etypecase) (let . let) (+ . t) (- . t) (* . t) (/ . t))))) (cond ((and (numberp arg) (< arg 0)) (dolist (cell syms) (when (ignore-errors (eq (symbol-function (intern-soft (format "a%s" (car cell)))) (intern-soft (format "anaphoric-%s" (car cell))))) (fmakunbound (intern (format "a%s" (car cell))))))) (t (dolist (cell syms) (let* ((builtin (car cell)) (traditional (intern (format "a%s" builtin))) (long (intern (format "anaphoric-%s" builtin)))) (defalias traditional long) (put traditional (quote lisp-indent-function) (get builtin (quote lisp-indent-function))) (put traditional (quote edebug-form-spec) (cdr cell))))))))

(unless anaphora-use-long-names-only (anaphora--install-traditional-aliases))

(autoload 'anaphoric-if "anaphora/anaphora" "\
Like `if', but the result of evaluating COND is bound to `it'.

The variable `it' is available within THEN and ELSE.

COND, THEN, and ELSE are otherwise as documented for `if'.

\(fn COND THEN &rest ELSE)" nil t)

(put 'anaphoric-if 'lisp-indent-function '2)

(autoload 'anaphoric-prog1 "anaphora/anaphora" "\
Like `prog1', but the result of evaluating FIRST is bound to `it'.

The variable `it' is available within BODY.

FIRST and BODY are otherwise as documented for `prog1'.

\(fn FIRST &rest BODY)" nil t)

(put 'anaphoric-prog1 'lisp-indent-function '1)

(autoload 'anaphoric-prog2 "anaphora/anaphora" "\
Like `prog2', but the result of evaluating FORM2 is bound to `it'.

The variable `it' is available within BODY.

FORM1, FORM2, and BODY are otherwise as documented for `prog2'.

\(fn FORM1 FORM2 &rest BODY)" nil t)

(put 'anaphoric-prog2 'lisp-indent-function '2)

(autoload 'anaphoric-when "anaphora/anaphora" "\
Like `when', but the result of evaluating COND is bound to `it'.

The variable `it' is available within BODY.

COND and BODY are otherwise as documented for `when'.

\(fn COND &rest BODY)" nil t)

(put 'anaphoric-when 'lisp-indent-function '1)

(autoload 'anaphoric-while "anaphora/anaphora" "\
Like `while', but the result of evaluating TEST is bound to `it'.

The variable `it' is available within BODY.

TEST and BODY are otherwise as documented for `while'.

\(fn TEST &rest BODY)" nil t)

(put 'anaphoric-while 'lisp-indent-function '1)

(autoload 'anaphoric-and "anaphora/anaphora" "\
Like `and', but the result of the previous condition is bound to `it'.

The variable `it' is available within all CONDITIONS after the
initial one.

CONDITIONS are otherwise as documented for `and'.

Note that some implementations of this macro bind only the first
condition to `it', rather than each successive condition.

\(fn &rest CONDITIONS)" nil t)

(autoload 'anaphoric-cond "anaphora/anaphora" "\
Like `cond', but the result of each condition is bound to `it'.

The variable `it' is available within the remainder of each of CLAUSES.

CLAUSES are otherwise as documented for `cond'.

\(fn &rest CLAUSES)" nil t)

(autoload 'anaphoric-lambda "anaphora/anaphora" "\
Like `lambda', but the function may refer to itself as `self'.

ARGS and BODY are otherwise as documented for `lambda'.

\(fn ARGS &rest BODY)" nil t)

(put 'anaphoric-lambda 'lisp-indent-function 'defun)

(autoload 'anaphoric-block "anaphora/anaphora" "\
Like `block', but the result of the previous expression is bound to `it'.

The variable `it' is available within all expressions of BODY
except the initial one.

NAME and BODY are otherwise as documented for `block'.

\(fn NAME &rest BODY)" nil t)

(put 'anaphoric-block 'lisp-indent-function '1)

(autoload 'anaphoric-case "anaphora/anaphora" "\
Like `case', but the result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `case'.

\(fn EXPR &rest CLAUSES)" nil t)

(put 'anaphoric-case 'lisp-indent-function '1)

(autoload 'anaphoric-ecase "anaphora/anaphora" "\
Like `ecase', but the result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `ecase'.

\(fn EXPR &rest CLAUSES)" nil t)

(put 'anaphoric-ecase 'lisp-indent-function '1)

(autoload 'anaphoric-typecase "anaphora/anaphora" "\
Like `typecase', but the result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `typecase'.

\(fn EXPR &rest CLAUSES)" nil t)

(put 'anaphoric-typecase 'lisp-indent-function '1)

(autoload 'anaphoric-etypecase "anaphora/anaphora" "\
Like `etypecase', but result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `etypecase'.

\(fn EXPR &rest CLAUSES)" nil t)

(put 'anaphoric-etypecase 'lisp-indent-function '1)

(autoload 'anaphoric-let "anaphora/anaphora" "\
Like `let', but the content of VARLIST is bound to `it'.

VARLIST as it appears in `it' is not evaluated.  The variable `it'
is available within BODY.

VARLIST and BODY are otherwise as documented for `let'.

\(fn VARLIST &rest BODY)" nil t)

(put 'anaphoric-let 'lisp-indent-function '1)

(autoload 'anaphoric-+ "anaphora/anaphora" "\
Like `+', but the result of evaluating the previous expression is bound to `it'.

The variable `it' is available within all expressions after the
initial one.

NUMBERS-OR-MARKERS are otherwise as documented for `+'.

\(fn &rest NUMBERS-OR-MARKERS)" nil t)

(autoload 'anaphoric-- "anaphora/anaphora" "\
Like `-', but the result of evaluating the previous expression is bound to `it'.

The variable `it' is available within all expressions after the
initial one.

NUMBER-OR-MARKER and NUMBERS-OR-MARKERS are otherwise as
documented for `-'.

\(fn &optional NUMBER-OR-MARKER &rest NUMBERS-OR-MARKERS)" nil t)

(autoload 'anaphoric-* "anaphora/anaphora" "\
Like `*', but the result of evaluating the previous expression is bound to `it'.

The variable `it' is available within all expressions after the
initial one.

NUMBERS-OR-MARKERS are otherwise as documented for `*'.

\(fn &rest NUMBERS-OR-MARKERS)" nil t)

(autoload 'anaphoric-/ "anaphora/anaphora" "\
Like `/', but the result of evaluating the previous divisor is bound to `it'.

The variable `it' is available within all expressions after the
first divisor.

DIVIDEND, DIVISOR, and DIVISORS are otherwise as documented for `/'.

\(fn DIVIDEND DIVISOR &rest DIVISORS)" nil t)

(autoload 'anaphoric-set "anaphora/anaphora" "\
Like `set', except that the value of SYMBOL is bound to `it'.

The variable `it' is available within VALUE.

SYMBOL and VALUE are otherwise as documented for `set'.

Note that if this macro followed traditional naming for
anaphoric expressions, it would conflict with the existing
\(quite different) function `aset'.

\(fn SYMBOL VALUE)" nil t)

(autoload 'anaphoric-setq "anaphora/anaphora" "\
Like `setq', except that the value of SYM is bound to `it'.

The variable `it' is available within each VAL.

ARGS in the form [SYM VAL] ... are otherwise as documented for `setq'.

No alias `asetq' is provided, because it would be easily mistaken
for the pre-existing `aset', and because `anaphoric-setq' is not
likely to find frequent use.

\(fn &rest ARGS)" nil t)

;;;***

;;;### (autoloads nil "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (21737 38254 249886 311000))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete/auto-complete" "\
AutoComplete mode

\(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global-Auto-Complete mode is enabled.
See the command `global-auto-complete-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete/auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete/auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global-Auto-Complete mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.
See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "auto-complete/auto-complete-config" "auto-complete/auto-complete-config.el"
;;;;;;  (21737 38254 246552 977000))
;;; Generated autoloads from auto-complete/auto-complete-config.el

(autoload 'ac-config-default "auto-complete/auto-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "bookmark+/bookmark+" "bookmark+/bookmark+.el"
;;;;;;  (21737 32038 159925 731000))
;;; Generated autoloads from bookmark+/bookmark+.el
 (autoload 'bmkp-version-number "bookmark+")
 (autoload 'bmkp-version "bookmark+")

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-1" "bookmark+/bookmark+-1.el"
;;;;;;  (21737 32038 153259 64000))
;;; Generated autoloads from bookmark+/bookmark+-1.el
 (autoload 'bmkp-prompt-for-tags-flag "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-min-distance "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode-delay "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode-lighter "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode-set-function "bookmark+")
 (autoload 'bmkp-autoname-bookmark-function "bookmark+")
 (autoload 'bmkp-autoname-format "bookmark+")
 (autoload 'bmkp-autotemp-bookmark-predicates "bookmark+")
 (autoload 'bmkp-bookmark-name-length-max "bookmark+")
 (autoload 'bmkp-count-multi-mods-as-one-flag "bookmark+")
 (autoload 'bmkp-crosshairs-flag "bookmark+")
 (autoload 'bmkp-default-bookmark-name "bookmark+")
 (autoload 'bmkp-default-handlers-for-file-types "bookmark+")
 (autoload 'bmkp-desktop-jump-save-before-flag "bookmark+")
 (autoload 'bmkp-desktop-no-save-vars "bookmark+")
 (autoload 'bmkp-annotation-modes-inherit-from "bookmark+")
 (autoload 'bmkp-handle-region-function "bookmark+")
 (autoload 'bmkp-incremental-filter-delay "bookmark+")
 (autoload 'bmkp-menu-popup-max-length "bookmark+")
 (autoload 'bmkp-new-bookmark-default-names "bookmark+")
 (autoload 'bmkp-other-window-pop-to-flag "bookmark+")
 (autoload 'bmkp-prompt-for-tags-flag "bookmark+")
 (autoload 'bmkp-region-search-size "bookmark+")
 (autoload 'bmkp-save-new-location-flag "bookmark+")
 (autoload 'bmkp-sequence-jump-display-function "bookmark+")
 (autoload 'bmkp-show-end-of-region-flag "bookmark+")
 (autoload 'bmkp-sort-comparer "bookmark+")
 (autoload 'bmkp-su-or-sudo-regexp "bookmark+")
 (autoload 'bmkp-tags-for-completion "bookmark+")
 (autoload 'bmkp-temporary-bookmarking-mode-hook "bookmark+")
 (autoload 'bmkp-this-file/buffer-cycle-sort-comparer "bookmark+")
 (autoload 'bmkp-guess-default-handler-for-file-flag "bookmark+")
 (autoload 'bmkp-read-bookmark-file-hook "bookmark+")
 (autoload 'bmkp-temporary-bookmarking-mode-lighter "bookmark+")
 (autoload 'bmkp-use-region "bookmark+")
 (autoload 'bmkp-w3m-allow-multi-tabs-flag "bookmark+")
 (autoload 'bmkp-write-bookmark-file-hook "bookmark+")
 (autoload 'bookmark-default-annotation-text "bookmark+")
 (autoload 'bookmark-insert-annotation "bookmark+")
 (autoload 'bookmark-edit-annotation-mode "bookmark+")
 (autoload 'bookmark-send-edited-annotation "bookmark+")
 (autoload 'bookmark-edit-annotation "bookmark+")
 (autoload 'bookmark-set "bookmark+")
 (autoload 'bookmark-yank-word "bookmark+")
 (autoload 'bookmark-jump "bookmark+")
 (autoload 'bookmark-jump-other-window "bookmark+")
 (autoload 'bookmark-relocate "bookmark+")
 (autoload 'bookmark-insert-location "bookmark+")
 (autoload 'bookmark-rename "bookmark+")
 (autoload 'bookmark-insert "bookmark+")
 (autoload 'bookmark-delete "bookmark+")
 (autoload 'bookmark-save "bookmark+")
 (autoload 'bookmark-load "bookmark+")
 (autoload 'bookmark-show-annotation "bookmark+")
 (autoload 'bookmark-show-all-annotations "bookmark+")
 (autoload 'bmkp-annotate-bookmark "bookmark+")
 (autoload 'bmkp-edit-bookmark-name-and-location "bookmark+")
 (autoload 'bmkp-edit-bookmark-records-send "bookmark+")
 (autoload 'bmkp-edit-bookmark-record "bookmark+")
 (autoload 'bmkp-edit-bookmark-record-send "bookmark+")
 (autoload 'bmkp-edit-tags "bookmark+")
 (autoload 'bmkp-edit-tags-send "bookmark+")
 (autoload 'bmkp-bookmark-set-confirm-overwrite "bookmark+")
 (autoload 'bmkp-send-bug-report "bookmark+")
 (autoload 'bmkp-toggle-bookmark-set-refreshes "bookmark+")
 (autoload 'bmkp-toggle-saving-menu-list-state "bookmark+")
 (autoload 'bmkp-save-menu-list-state "bookmark+")
 (autoload 'bmkp-toggle-saving-bookmark-file "bookmark+")
 (autoload 'bmkp-make-function-bookmark "bookmark+")
 (autoload 'bmkp-revert-bookmark-file "bookmark+")
 (autoload 'bmkp-switch-bookmark-file "bookmark+")
 (autoload 'bmkp-switch-to-last-bookmark-file "bookmark+")
 (autoload 'bmkp-switch-bookmark-file-create "bookmark+")
 (autoload 'bmkp-empty-file "bookmark+")
 (autoload 'bmkp-crosshairs-highlight "bookmark+")
 (autoload 'bmkp-choose-navlist-from-bookmark-list "bookmark+")
 (autoload 'bmkp-choose-navlist-of-type "bookmark+")
 (autoload 'bmkp-this-file/buffer-bmenu-list "bookmark+")
 (autoload 'bmkp-this-file-bmenu-list "bookmark+")
 (autoload 'bmkp-this-buffer-bmenu-list "bookmark+")
 (autoload 'bmkp-navlist-bmenu-list "bookmark+")
 (autoload 'bmkp-unomit-all "bookmark+")
 (autoload 'bmkp-list-all-tags "bookmark+")
 (autoload 'bmkp-remove-all-tags "bookmark+")
 (autoload 'bmkp-add-tags "bookmark+")
 (autoload 'bmkp-set-tag-value-for-navlist "bookmark+")
 (autoload 'bmkp-set-tag-value "bookmark+")
 (autoload 'bmkp-remove-tags "bookmark+")
 (autoload 'bmkp-remove-tags-from-all "bookmark+")
 (autoload 'bmkp-rename-tag "bookmark+")
 (autoload 'bmkp-copy-tags "bookmark+")
 (autoload 'bmkp-paste-add-tags "bookmark+")
 (autoload 'bmkp-paste-replace-tags "bookmark+")
 (autoload 'bmkp-url-target-set "bookmark+")
 (autoload 'bmkp-file-target-set "bookmark+")
 (autoload 'bmkp-bookmark-a-file "bookmark+")
 (autoload 'bmkp-autofile-set "bookmark+")
 (autoload 'bmkp-tag-a-file "bookmark+")
 (autoload 'bmkp-autofile-add-tags "bookmark+")
 (autoload 'bmkp-untag-a-file "bookmark+")
 (autoload 'bmkp-autofile-remove-tags "bookmark+")
 (autoload 'bmkp-purge-notags-autofiles "bookmark+")
 (autoload 'bmkp-describe-bookmark "bookmark+")
 (autoload 'bmkp-describe-bookmark-internals "bookmark+")
 (autoload 'bmkp-list-defuns-in-commands-file "bookmark+")
 (autoload 'bmkp-set-bookmark-file-bookmark "bookmark+")
 (autoload 'bmkp-bookmark-file-jump "bookmark+")
 (autoload 'bmkp-set-snippet-bookmark "bookmark+")
 (autoload 'bmkp-snippet-to-kill-ring "bookmark+")
 (autoload 'bmkp-set-desktop-bookmark "bookmark+")
 (autoload 'bmkp-desktop-change-dir "bookmark+")
 (autoload 'bmkp-desktop-read "bookmark+")
 (autoload 'bmkp-desktop-delete "bookmark+")
 (autoload 'bmkp-retrieve-icicle-search-hits "bookmark+")
 (autoload 'bmkp-retrieve-more-icicle-search-hits "bookmark+")
 (autoload 'bmkp-set-icicle-search-hits-bookmark "bookmark+")
 (autoload 'bmkp-wrap-bookmark-with-last-kbd-macro "bookmark+")
 (autoload 'bmkp-set-sequence-bookmark "bookmark+")
 (autoload 'bmkp-set-variable-list-bookmark "bookmark+")
 (autoload 'bmkp-dired-subdirs "bookmark+")
 (autoload 'bmkp-jump-to-type "bookmark+")
 (autoload 'bmkp-jump-to-type-other-window "bookmark+")
 (autoload 'bmkp-autonamed-jump "bookmark+")
 (autoload 'bmkp-autonamed-jump-other-window "bookmark+")
 (autoload 'bmkp-autonamed-this-buffer-jump "bookmark+")
 (autoload 'bmkp-autonamed-this-buffer-jump-other-window "bookmark+")
 (autoload 'bmkp-bookmark-list-jump "bookmark+")
 (autoload 'bmkp-desktop-jump "bookmark+")
 (autoload 'bmkp-dired-jump "bookmark+")
 (autoload 'bmkp-dired-jump-other-window "bookmark+")
 (autoload 'bmkp-dired-this-dir-jump "bookmark+")
 (autoload 'bmkp-dired-this-dir-jump-other-window "bookmark+")
 (autoload 'bmkp-file-jump "bookmark+")
 (autoload 'bmkp-file-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-jump-other-window "bookmark+")
 (autoload 'bmkp-gnus-jump "bookmark+")
 (autoload 'bmkp-gnus-jump-other-window "bookmark+")
 (autoload 'bmkp-image-jump "bookmark+")
 (autoload 'bmkp-image-jump-other-window "bookmark+")
 (autoload 'bmkp-info-jump "bookmark+")
 (autoload 'bmkp-info-jump-other-window "bookmark+")
 (autoload 'bmkp-local-file-jump "bookmark+")
 (autoload 'bmkp-local-file-jump-other-window "bookmark+")
 (autoload 'bmkp-local-non-dir-file-jump "bookmark+")
 (autoload 'bmkp-local-non-dir-file-jump-other-window "bookmark+")
 (autoload 'bmkp-man-jump "bookmark+")
 (autoload 'bmkp-man-jump-other-window "bookmark+")
 (autoload 'bmkp-non-dir-file-jump "bookmark+")
 (autoload 'bmkp-non-dir-file-jump-other-window "bookmark+")
 (autoload 'bmkp-non-file-jump "bookmark+")
 (autoload 'bmkp-non-file-jump-other-window "bookmark+")
 (autoload 'bmkp-region-jump "bookmark+")
 (autoload 'bmkp-region-jump-other-window "bookmark+")
 (autoload 'bmkp-region-jump-narrow-indirect-other-window "bookmark+")
 (autoload 'bmkp-remote-file-jump "bookmark+")
 (autoload 'bmkp-remote-file-jump-other-window "bookmark+")
 (autoload 'bmkp-remote-non-dir-file-jump "bookmark+")
 (autoload 'bmkp-remote-non-dir-file-jump-other-window "bookmark+")
 (autoload 'bmkp-specific-buffers-jump "bookmark+")
 (autoload 'bmkp-specific-buffers-jump-other-window "bookmark+")
 (autoload 'bmkp-specific-files-jump "bookmark+")
 (autoload 'bmkp-specific-files-jump-other-window "bookmark+")
 (autoload 'bmkp-temporary-jump "bookmark+")
 (autoload 'bmkp-temporary-jump-other-window "bookmark+")
 (autoload 'bmkp-this-buffer-jump "bookmark+")
 (autoload 'bmkp-this-buffer-jump-other-window "bookmark+")
 (autoload 'bmkp-variable-list-jump "bookmark+")
 (autoload 'bmkp-url-jump "bookmark+")
 (autoload 'bmkp-url-jump-other-window "bookmark+")
 (autoload 'bmkp-w32-browser-jump "bookmark+")
 (autoload 'bmkp-w3m-jump "bookmark+")
 (autoload 'bmkp-w3m-jump-other-window "bookmark+")
 (autoload 'bmkp-all-tags-jump "bookmark+")
 (autoload 'bmkp-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-some-tags-jump "bookmark+")
 (autoload 'bmkp-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-all-tags-jump "bookmark+")
 (autoload 'bmkp-file-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-some-tags-jump "bookmark+")
 (autoload 'bmkp-file-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-jump "bookmark+")
 (autoload 'bmkp-autofile-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-all-tags-jump "bookmark+")
 (autoload 'bmkp-autofile-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-autofile-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-some-tags-jump "bookmark+")
 (autoload 'bmkp-autofile-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-autofile-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-find-file-all-tags-regexp-other-window "bookmark+")
 (autoload 'bmkp-find-file-some-tags "bookmark+")
 (autoload 'bmkp-find-file-some-tags-other-window "bookmark+")
 (autoload 'bmkp-find-file-some-tags-regexp "bookmark+")
 (autoload 'bmkp-find-file-some-tags-regexp-other-window "bookmark+")
 (autoload 'bmkp-jump-in-navlist "bookmark+")
 (autoload 'bmkp-jump-in-navlist-other-window "bookmark+")
 (autoload 'bmkp-cycle "bookmark+")
 (autoload 'bmkp-cycle-other-window "bookmark+")
 (autoload 'bmkp-cycle-this-file/buffer "bookmark+")
 (autoload 'bmkp-cycle-this-file/buffer-other-window "bookmark+")
 (autoload 'bmkp-cycle-this-file "bookmark+")
 (autoload 'bmkp-cycle-this-file-other-window "bookmark+")
 (autoload 'bmkp-cycle-this-buffer "bookmark+")
 (autoload 'bmkp-cycle-this-buffer-other-window "bookmark+")
 (autoload 'bmkp-next-bookmark "bookmark+")
 (autoload 'bmkp-previous-bookmark "bookmark+")
 (autoload 'bmkp-next-bookmark-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file/buffer "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file/buffer "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file/buffer-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file/buffer-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-next-bookmark-this-buffer-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-buffer-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-w32 "bookmark+")
 (autoload 'bmkp-previous-bookmark-w32 "bookmark+")
 (autoload 'bmkp-next-bookmark-w32-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-w32-repeat "bookmark+")
 (autoload 'bmkp-toggle-autonamed-bookmark-set/delete "bookmark+")
 (autoload 'bmkp-set-autonamed-bookmark "bookmark+")
 (autoload 'bmkp-set-autonamed-bookmark-at-line "bookmark+")
 (autoload 'bmkp-set-autonamed-regexp-buffer "bookmark+")
 (autoload 'bmkp-set-autonamed-regexp-region "bookmark+")
 (autoload 'bmkp-delete-all-autonamed-for-this-buffer "bookmark+")
 (autoload 'bmkp-toggle-autotemp-on-set "bookmark+")
 (autoload 'bmkp-toggle-temporary-bookmark "bookmark+")
 (autoload 'bmkp-make-bookmark-temporary "bookmark+")
 (autoload 'bmkp-make-bookmark-savable "bookmark+")
 (autoload 'bmkp-delete-all-temporary-bookmarks "bookmark+")
 (autoload 'bmkp-delete-bookmarks "bookmark+")

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-bmu" "bookmark+/bookmark+-bmu.el"
;;;;;;  (21737 32038 156592 399000))
;;; Generated autoloads from bookmark+/bookmark+-bmu.el
 (autoload 'bmkp-bmenu-omitted-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-commands-file "bookmark+")
 (autoload 'bmkp-bmenu-state-file "bookmark+")
 (autoload 'bmkp-bmenu-image-bookmark-icon-file "bookmark+")
 (autoload 'bookmark-bmenu-mark "bookmark+")
 (autoload 'bookmark-bmenu-unmark "bookmark+")
 (autoload 'bmkp-bmenu-flag-for-deletion "bookmark+")
 (autoload 'bookmark-bmenu-delete "bookmark+")
 (autoload 'bmkp-bmenu-flag-for-deletion-backwards "bookmark+")
 (autoload 'bookmark-bmenu-delete-backwards "bookmark+")
 (autoload 'list-bookmarks "bookmark+")
 (autoload 'bookmark-bmenu-list "bookmark+")
 (autoload 'bookmark-bmenu-1-window "bookmark+")
 (autoload 'bookmark-bmenu-2-window "bookmark+")
 (autoload 'bookmark-bmenu-this-window "bookmark+")
 (autoload 'bookmark-bmenu-other-window "bookmark+")
 (autoload 'bookmark-bmenu-switch-other-window "bookmark+")
 (autoload 'bookmark-bmenu-other-window-with-mouse "bookmark+")
 (autoload 'bookmark-bmenu-show-annotation "bookmark+")
 (autoload 'bookmark-bmenu-execute-deletions "bookmark+")
 (autoload 'bookmark-bmenu-rename "bookmark+")
 (autoload 'bmkp-bmenu-show-all "bookmark+")
 (autoload 'bmkp-bmenu-show-only-autofiles "bookmark+")
 (autoload 'bmkp-bmenu-show-only-autonamed "bookmark+")
 (autoload 'bmkp-bmenu-show-only-bookmark-files "bookmark+")
 (autoload 'bmkp-bmenu-show-only-bookmark-lists "bookmark+")
 (autoload 'bmkp-bmenu-show-only-desktops "bookmark+")
 (autoload 'bmkp-bmenu-show-only-dired "bookmark+")
 (autoload 'bmkp-bmenu-show-only-files "bookmark+")
 (autoload 'bmkp-bmenu-show-only-gnus "bookmark+")
 (autoload 'bmkp-bmenu-show-only-icicle-search-hits "bookmark+")
 (autoload 'bmkp-bmenu-show-only-image-files "bookmark+")
 (autoload 'bmkp-bmenu-show-only-info-nodes "bookmark+")
 (autoload 'bmkp-bmenu-show-only-man-pages "bookmark+")
 (autoload 'bmkp-bmenu-show-only-non-files "bookmark+")
 (autoload 'bmkp-bmenu-show-only-orphaned-local-files "bookmark+")
 (autoload 'bmkp-bmenu-show-only-regions "bookmark+")
 (autoload 'bmkp-bmenu-show-only-snippets "bookmark+")
 (autoload 'bmkp-bmenu-show-only-specific-buffer "bookmark+")
 (autoload 'bmkp-bmenu-show-only-specific-file "bookmark+")
 (autoload 'bmkp-bmenu-show-only-temporary "bookmark+")
 (autoload 'bmkp-bmenu-show-only-variable-lists "bookmark+")
 (autoload 'bmkp-bmenu-show-only-urls "bookmark+")
 (autoload 'bmkp-bmenu-show-only-w3m-urls "bookmark+")
 (autoload 'bmkp-bmenu-refresh-menu-list "bookmark+")
 (autoload 'bmkp-bmenu-filter-bookmark-name-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-filter-file-name-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-filter-annotation-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-filter-tags-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-toggle-show-only-unmarked "bookmark+")
 (autoload 'bmkp-bmenu-toggle-show-only-marked "bookmark+")
 (autoload 'bmkp-bmenu-mark-all "bookmark+")
 (autoload 'bmkp-bmenu-unmark-all "bookmark+")
 (autoload 'bmkp-bmenu-regexp-mark "bookmark+")
 (autoload 'bmkp-bmenu-mark-autofile-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-autonamed-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmark-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmark-list-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-desktop-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-dired-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-gnus-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-icicle-search-hits-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-image-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-info-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-man-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-non-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-orphaned-local-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-region-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-snippet-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-specific-buffer-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-specific-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-temporary-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-variable-list-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-url-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-w3m-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-satisfying "bookmark+")
 (autoload 'bmkp-bmenu-toggle-marks "bookmark+")
 (autoload 'bmkp-bmenu-toggle-marked-temporary/savable "bookmark+")
 (autoload 'bmkp-bmenu-toggle-temporary "bookmark+")
 (autoload 'bmkp-bmenu-dired-marked "bookmark+")
 (autoload 'bmkp-bmenu-delete-marked "bookmark+")
 (autoload 'bmkp-bmenu-move-marked-to-bookmark-file "bookmark+")
 (autoload 'bmkp-bmenu-copy-marked-to-bookmark-file "bookmark+")
 (autoload 'bmkp-bmenu-create-bookmark-file-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-set-bookmark-file-bookmark-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-load-marked-bookmark-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-make-sequence-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-omit "bookmark+")
 (autoload 'bmkp-bmenu-omit/unomit-marked "bookmark+")
 (autoload 'bmkp-bmenu-omit-marked "bookmark+")
 (autoload 'bmkp-bmenu-unomit-marked "bookmark+")
 (autoload 'bmkp-bmenu-show-only-omitted "bookmark+")
 (autoload 'bmkp-bmenu-search-marked-bookmarks-regexp "bookmark+")
 (autoload 'bmkp-bmenu-query-replace-marked-bookmarks-regexp "bookmark+")
 (autoload 'bmkp-bmenu-show-only-tagged "bookmark+")
 (autoload 'bmkp-bmenu-remove-all-tags "bookmark+")
 (autoload 'bmkp-bmenu-add-tags "bookmark+")
 (autoload 'bmkp-bmenu-set-tag-value "bookmark+")
 (autoload 'bmkp-bmenu-set-tag-value-for-marked "bookmark+")
 (autoload 'bmkp-bmenu-remove-tags "bookmark+")
 (autoload 'bmkp-bmenu-add-tags-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-remove-tags-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-list-tags-of-marked "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-regexp "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-all "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-none "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-some "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-not-all "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-regexp "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-all "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-none "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-some "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-not-all "bookmark+")
 (autoload 'bmkp-bmenu-copy-tags "bookmark+")
 (autoload 'bmkp-bmenu-paste-add-tags "bookmark+")
 (autoload 'bmkp-bmenu-paste-replace-tags "bookmark+")
 (autoload 'bmkp-bmenu-paste-add-tags-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-paste-replace-tags-for-marked "bookmark+")
 (autoload 'bmkp-bmenu-show-or-edit-annotation "bookmark+")
 (autoload 'bmkp-bmenu-jump-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-w32-open "bookmark+")
 (autoload 'bmkp-bmenu-w32-open-with-mouse "bookmark+")
 (autoload 'bmkp-bmenu-w32-jump-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-mode-status-help "bookmark+")
 (autoload 'bmkp-bmenu-define-jump-marked-command "bookmark+")
 (autoload 'bmkp-bmenu-define-command "bookmark+")
 (autoload 'bmkp-bmenu-define-full-snapshot-command "bookmark+")
 (autoload 'bmkp-define-tags-sort-command "bookmark+")
 (autoload 'bmkp-bmenu-relocate-marked "bookmark+")
 (autoload 'bmkp-bmenu-edit-bookmark-name-and-location "bookmark+")
 (autoload 'bmkp-bmenu-edit-tags "bookmark+")
 (autoload 'bmkp-bmenu-edit-bookmark-record "bookmark+")
 (autoload 'bmkp-bmenu-edit-marked "bookmark+")
 (autoload 'bmkp-bmenu-quit "bookmark+")
 (autoload 'bmkp-bmenu-change-sort-order-repeat "bookmark+")
 (autoload 'bmkp-bmenu-change-sort-order "bookmark+")
 (autoload 'bmkp-reverse-sort-order "bookmark+")
 (autoload 'bmkp-reverse-multi-sort-order "bookmark+")
 (autoload 'bmkp-bmenu-describe-this+move-down "bookmark+")
 (autoload 'bmkp-bmenu-describe-this+move-up "bookmark+")
 (autoload 'bmkp-bmenu-describe-this-bookmark "bookmark+")
 (autoload 'bmkp-bmenu-describe-marked "bookmark+")
 (autoload 'bmkp-bmenu-mouse-3-menu "bookmark+")

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-lit" "bookmark+/bookmark+-lit.el"
;;;;;;  (21737 32038 159925 731000))
;;; Generated autoloads from bookmark+/bookmark+-lit.el
 (autoload 'bmkp-auto-light-relocate-when-jump-flag "bookmark+")
 (autoload 'bmkp-auto-light-when-jump "bookmark+")
 (autoload 'bmkp-auto-light-when-set "bookmark+")
 (autoload 'bmkp-light-priorities "bookmark+")
 (autoload 'bmkp-light-style-autonamed "bookmark+")
 (autoload 'bmkp-light-style-non-autonamed "bookmark+")
 (autoload 'bmkp-light-threshold "bookmark+")
 (autoload 'bmkp-bmenu-show-only-lighted "bookmark+")
 (autoload 'bmkp-bmenu-light "bookmark+")
 (autoload 'bmkp-bmenu-light-marked "bookmark+")
 (autoload 'bmkp-bmenu-unlight "bookmark+")
 (autoload 'bmkp-bmenu-unlight-marked "bookmark+")
 (autoload 'bmkp-bmenu-set-lighting "bookmark+")
 (autoload 'bmkp-bmenu-set-lighting-for-marked "bookmark+")
 (autoload 'bmkp-bookmarks-lighted-at-point "bookmark+")
 (autoload 'bmkp-toggle-auto-light-when-jump "bookmark+")
 (autoload 'bmkp-lighted-jump "bookmark+")
 (autoload 'bmkp-lighted-jump-other-window "bookmark+")
 (autoload 'bmkp-unlight-bookmark "bookmark+")
 (autoload 'bmkp-unlight-bookmark-here "bookmark+")
 (autoload 'bmkp-unlight-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-unlight-bookmarks "bookmark+")
 (autoload 'bmkp-unlight-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-unlight-non-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-unlight-this-buffer "bookmark+")
 (autoload 'bmkp-toggle-auto-light-when-set "bookmark+")
 (autoload 'bmkp-set-lighting-for-bookmark "bookmark+")
 (autoload 'bmkp-set-lighting-for-buffer "bookmark+")
 (autoload 'bmkp-set-lighting-for-this-buffer "bookmark+")
 (autoload 'bmkp-light-bookmark "bookmark+")
 (autoload 'bmkp-light-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-light-bookmarks "bookmark+")
 (autoload 'bmkp-light-navlist-bookmarks "bookmark+")
 (autoload 'bmkp-light-this-buffer "bookmark+")
 (autoload 'bmkp-light-bookmarks-in-region "bookmark+")
 (autoload 'bmkp-light-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-light-non-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-cycle-lighted-this-buffer "bookmark+")
 (autoload 'bmkp-cycle-lighted-this-buffer-other-window "bookmark+")
 (autoload 'bmkp-next-lighted-this-buffer "bookmark+")
 (autoload 'bmkp-previous-lighted-this-buffer "bookmark+")
 (autoload 'bmkp-next-lighted-this-buffer-repeat "bookmark+")
 (autoload 'bmkp-previous-lighted-this-buffer-repeat "bookmark+")

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-mac" "bookmark+/bookmark+-mac.el"
;;;;;;  (21737 32038 159925 731000))
;;; Generated autoloads from bookmark+/bookmark+-mac.el
 (autoload 'bmkp-with-help-window "bookmark+")
 (autoload 'bmkp-with-output-to-plain-temp-buffer "bookmark+")
 (autoload 'bmkp-define-cycle-command "bookmark+")
 (autoload 'bmkp-define-next+prev-cycle-commands "bookmark+")
 (autoload 'bmkp-define-sort-command "bookmark+")
 (autoload 'bmkp-define-file-sort-predicate "bookmark+")
 (autoload 'bmkp-menu-bar-make-toggle "bookmark+")
 (autoload 'bmkp-with-bookmark-dir "bookmark+")

;;;***

;;;### (autoloads nil "cmake-mode/cmake-mode" "cmake-mode/cmake-mode.el"
;;;;;;  (21737 32100 589925 336000))
;;; Generated autoloads from cmake-mode/cmake-mode.el

(autoload 'cmake-mode "cmake-mode/cmake-mode" "\
Major mode for editing CMake listfiles.

\(fn)" t nil)

(autoload 'cmake-command-run "cmake-mode/cmake-mode" "\
Runs the command cmake with the arguments specified.  The
optional argument topic will be appended to the argument list.

\(fn TYPE &optional TOPIC BUFFER)" t nil)

(autoload 'cmake-help-list-commands "cmake-mode/cmake-mode" "\
Prints out a list of the cmake commands.

\(fn)" t nil)

(autoload 'cmake-help-command "cmake-mode/cmake-mode" "\
Prints out the help message for the command the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help-module "cmake-mode/cmake-mode" "\
Prints out the help message for the module the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help-variable "cmake-mode/cmake-mode" "\
Prints out the help message for the variable the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help-property "cmake-mode/cmake-mode" "\
Prints out the help message for the property the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help "cmake-mode/cmake-mode" "\
Queries for any of the four available help topics and prints out the approriate page.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))

(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

;;;***

;;;### (autoloads nil "company-c-headers/company-c-headers" "company-c-headers/company-c-headers.el"
;;;;;;  (21735 17192 449911 276000))
;;; Generated autoloads from company-c-headers/company-c-headers.el

(autoload 'company-c-headers "company-c-headers/company-c-headers" "\
Company backend for C/C++ header files.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company" "company-mode/company.el"
;;;;;;  (21735 5389 996652 791000))
;;; Generated autoloads from company-mode/company.el

(autoload 'company-mode "company-mode/company" "\
\"complete anything\"; is an in-buffer completion framework.
Completion starts automatically, depending on the values
`company-idle-delay' and `company-minimum-prefix-length'.

Completion can be controlled with the commands:
`company-complete-common', `company-complete-selection', `company-complete',
`company-select-next', `company-select-previous'.  If these commands are
called before `company-idle-delay', completion will also start.

Completions can be searched with `company-search-candidates' or
`company-filter-candidates'.  These can be used while completion is
inactive, as well.

The completion data is retrieved using `company-backends' and displayed
using `company-frontends'.  If you want to start a specific back-end, call
it interactively or use `company-begin-backend'.

regular keymap (`company-mode-map'):

\\{company-mode-map}
keymap during active completions (`company-active-map'):

\\{company-active-map}

\(fn &optional ARG)" t nil)

(defvar global-company-mode nil "\
Non-nil if Global-Company mode is enabled.
See the command `global-company-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-company-mode'.")

(custom-autoload 'global-company-mode "company-mode/company" nil)

(autoload 'global-company-mode "company-mode/company" "\
Toggle Company mode in all buffers.
With prefix ARG, enable Global-Company mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Company mode is enabled in all buffers where
`company-mode-on' would do it.
See `company-mode' for more information on Company mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-abbrev" "company-mode/company-abbrev.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-abbrev.el

(autoload 'company-abbrev "company-mode/company-abbrev" "\
`company-mode' completion back-end for abbrev.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-bbdb" "company-mode/company-bbdb.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-bbdb.el

(autoload 'company-bbdb "company-mode/company-bbdb" "\
`company-mode' completion back-end for BBDB.

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-css" "company-mode/company-css.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-css.el

(autoload 'company-css "company-mode/company-css" "\
`company-mode' completion back-end for `css-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-dabbrev" "company-mode/company-dabbrev.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-dabbrev.el

(autoload 'company-dabbrev "company-mode/company-dabbrev" "\
dabbrev-like `company-mode' completion back-end.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-dabbrev-code" "company-mode/company-dabbrev-code.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-dabbrev-code.el

(autoload 'company-dabbrev-code "company-mode/company-dabbrev-code" "\
dabbrev-like `company-mode' back-end for code.
The back-end looks for all symbols in the current buffer that aren't in
comments or strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-elisp" "company-mode/company-elisp.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-elisp.el

(autoload 'company-elisp "company-mode/company-elisp" "\
`company-mode' completion back-end for Emacs Lisp.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-etags" "company-mode/company-etags.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-etags.el

(autoload 'company-etags "company-mode/company-etags" "\
`company-mode' completion back-end for etags.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-files" "company-mode/company-files.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-files.el

(autoload 'company-files "company-mode/company-files" "\
`company-mode' completion back-end existing file names.
Completions works for proper absolute and relative files paths.
File paths with spaces are only supported inside strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-gtags" "company-mode/company-gtags.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-gtags.el

(autoload 'company-gtags "company-mode/company-gtags" "\
`company-mode' completion back-end for GNU Global.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-ispell" "company-mode/company-ispell.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-ispell.el

(autoload 'company-ispell "company-mode/company-ispell" "\
`company-mode' completion back-end using Ispell.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-keywords" "company-mode/company-keywords.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-keywords.el

(autoload 'company-keywords "company-mode/company-keywords" "\
`company-mode' back-end for programming language keywords.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-nxml" "company-mode/company-nxml.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-nxml.el

(autoload 'company-nxml "company-mode/company-nxml" "\
`company-mode' completion back-end for `nxml-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-oddmuse" "company-mode/company-oddmuse.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-oddmuse.el

(autoload 'company-oddmuse "company-mode/company-oddmuse" "\
`company-mode' completion back-end for `oddmuse-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-pysmell" "company-mode/company-pysmell.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-pysmell.el

(autoload 'company-pysmell "company-mode/company-pysmell" "\
`company-mode' completion back-end for pysmell.
This requires pysmell.el and pymacs.el.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-semantic" "company-mode/company-semantic.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-semantic.el

(autoload 'company-semantic "company-mode/company-semantic" "\
`company-mode' completion back-end using CEDET Semantic.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-tempo" "company-mode/company-tempo.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-tempo.el

(autoload 'company-tempo "company-mode/company-tempo" "\
`company-mode' completion back-end for tempo.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-xcode" "company-mode/company-xcode.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-xcode.el

(autoload 'company-xcode "company-mode/company-xcode" "\
`company-mode' completion back-end for Xcode projects.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-yasnippet" "company-mode/company-yasnippet.el"
;;;;;;  (21735 5389 993319 457000))
;;; Generated autoloads from company-mode/company-yasnippet.el

(autoload 'company-yasnippet "company-mode/company-yasnippet" "\
`company-mode' back-end for `yasnippet'.

This back-end should be used with care, because as long as there are
snippets defined for the current major mode, this back-end will always
shadow back-ends that come after it.  Recommended usages:

* In a buffer-local value of `company-backends', grouped with a back-end or
  several that provide actual text completions.

  (add-hook 'js-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-dabbrev-code company-yasnippet)))))

* After keyword `:with', grouped with other back-ends.

  (push '(company-semantic :with company-yasnippet) company-backends)

* Not in `company-backends', just bound to a key.

  (global-set-key (kbd \"C-c y\") 'company-yasnippet)

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "emacs-ycmd/auto-complete-ycmd" "emacs-ycmd/auto-complete-ycmd.el"
;;;;;;  (21735 16569 416581 894000))
;;; Generated autoloads from emacs-ycmd/auto-complete-ycmd.el

(autoload 'ac-ycmd-setup "emacs-ycmd/auto-complete-ycmd" "\
Add ac-source-ycmd to autocomplete list.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "emacs-ycmd/company-ycmd" "emacs-ycmd/company-ycmd.el"
;;;;;;  (21735 16569 416581 894000))
;;; Generated autoloads from emacs-ycmd/company-ycmd.el

(autoload 'company-ycmd-setup "emacs-ycmd/company-ycmd" "\
Add company-ycmd to the front of company-backends

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "emacs-ycmd/flycheck-ycmd" "emacs-ycmd/flycheck-ycmd.el"
;;;;;;  (21735 16569 416581 894000))
;;; Generated autoloads from emacs-ycmd/flycheck-ycmd.el

(autoload 'flycheck-ycmd-setup "emacs-ycmd/flycheck-ycmd" "\
Convenience function to setup the ycmd flycheck checker.

This adds a hook to watch for ycmd parse results, and it adds the
ycmd checker to the list of flycheck checkers.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "emacs-ycmd/ycmd" "emacs-ycmd/ycmd.el" (21735
;;;;;;  16569 416581 894000))
;;; Generated autoloads from emacs-ycmd/ycmd.el

(autoload 'ycmd-mode "emacs-ycmd/ycmd" "\
Minor mode for interaction with the ycmd completion server.

When called interactively, toggle `ycmd-mode'.  With prefix ARG,
enable `ycmd-mode' if ARG is positive, otherwise disable it.

When called from Lisp, enable `ycmd-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `ycmd-mode'.
Otherwise behave as if called interactively.

\\{ycmd-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'ycmd-setup "emacs-ycmd/ycmd" "\
Setup `ycmd-mode'.

Hook `ycmd-mode' into modes in `ycmd-file-type-map'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "flymake/flymake" "flymake/flymake.el" (21737
;;;;;;  41016 116535 463000))
;;; Generated autoloads from flymake/flymake.el

(autoload 'flymake-mode "flymake/flymake" "\
Toggle on-the-fly syntax checking.
With a prefix argument ARG, enable the mode if ARG is positive,
and disable it otherwise.  If called from Lisp, enable the mode
if ARG is omitted or nil.

\(fn &optional ARG)" t nil)

(autoload 'flymake-mode-on "flymake/flymake" "\
Turn flymake mode on.

\(fn)" nil nil)

(autoload 'flymake-mode-off "flymake/flymake" "\
Turn flymake mode off.

\(fn)" nil nil)

(autoload 'flymake-find-file-hook "flymake/flymake" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "go-mode/go-mode" "go-mode/go-mode.el" (21735
;;;;;;  12636 263273 503000))
;;; Generated autoloads from go-mode/go-mode.el

(autoload 'go-mode "go-mode/go-mode" "\
Major mode for editing Go source text.

This mode provides (not just) basic editing capabilities for
working with Go code. It offers almost complete syntax
highlighting, indentation that is almost identical to gofmt and
proper parsing of the buffer content to allow features such as
navigation by function, manipulation of comments or detection of
strings.

In addition to these core features, it offers various features to
help with writing Go code. You can directly run buffer content
through gofmt, read godoc documentation from within Emacs, modify
and clean up the list of package imports or interact with the
Playground (uploading and downloading pastes).

The following extra functions are defined:

- `gofmt'
- `godoc'
- `go-import-add'
- `go-remove-unused-imports'
- `go-goto-imports'
- `go-play-buffer' and `go-play-region'
- `go-download-play'
- `godef-describe' and `godef-jump'
- `go-coverage'

If you want to automatically run `gofmt' before saving a file,
add the following hook to your emacs configuration:

\(add-hook 'before-save-hook #'gofmt-before-save)

If you want to use `godef-jump' instead of etags (or similar),
consider binding godef-jump to `M-.', which is the default key
for `find-tag':

\(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd \"M-.\") #'godef-jump)))

Please note that godef is an external dependency. You can install
it with

go get code.google.com/p/rog-go/exp/cmd/godef


If you're looking for even more integration with Go, namely
on-the-fly syntax checking, auto-completion and snippets, it is
recommended that you look at flycheck
\(see URL `https://github.com/flycheck/flycheck') or flymake in combination
with goflymake (see URL `https://github.com/dougm/goflymake'), gocode
\(see URL `https://github.com/nsf/gocode'), go-eldoc
\(see URL `github.com/syohex/emacs-go-eldoc') and yasnippet-go
\(see URL `https://github.com/dominikh/yasnippet-go')

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.go\\'" 'go-mode))

(autoload 'gofmt-before-save "go-mode/go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook 'gofmt-before-save).

Note that this will cause go-mode to get loaded the first time
you save any file, kind of defeating the point of autoloading.

\(fn)" t nil)

(autoload 'godoc "go-mode/go-mode" "\
Show Go documentation for a query, much like M-x man.

\(fn QUERY)" t nil)

(autoload 'go-download-play "go-mode/go-mode" "\
Downloads a paste from the playground and inserts it in a Go
buffer. Tries to look for a URL at point.

\(fn URL)" t nil)

;;;***

;;;### (autoloads nil "header2/header2" "header2/header2.el" (21737
;;;;;;  27987 523284 753000))
;;; Generated autoloads from header2/header2.el

(autoload 'make-header "header2/header2" "\
Insert (mode-dependent) header comment at beginning of file.
A header is composed of a mode line, a body, and an end line.  The body is
constructed by calling the functions in `make-header-hook'.  The mode line
and end lines start and terminate block comments.  The body lines continue
the comment.

\(fn)" t nil)

(autoload 'make-revision "header2/header2" "\
Prepare for a new history revision.  Insert history line if inexistant.

\(fn)" t nil)

(autoload 'make-divider "header2/header2" "\
Insert a comment divider line: the comment start, filler, and end.
END-COL is the last column of the divider line.

\(fn &optional END-COL)" t nil)

(autoload 'make-box-comment "header2/header2" "\
Insert an empty (mode dependent) box comment.
END-COL is the last column of the divider line.

\(fn &optional END-COL)" t nil)

(autoload 'update-file-header "header2/header2" "\
Update file header.
Search the first `header-max' chars in buffer using regexps in
`file-header-update-alist'.  When a match is found, apply the
corresponding function with point located just after the match.
The functions can use `match-beginning' and `match-end' to find
the strings that cause them to be invoked.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "highline/highline" "highline/highline.el"
;;;;;;  (21737 34748 886575 208000))
;;; Generated autoloads from highline/highline.el

(autoload 'highline-customize "highline/highline" "\
Customize highline group.

\(fn)" t nil)

(defvar global-highline-mode nil "\
Non-nil if Global-Highline mode is enabled.
See the command `global-highline-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-highline-mode'.")

(custom-autoload 'global-highline-mode "highline/highline" nil)

(autoload 'global-highline-mode "highline/highline" "\
Toggle global minor mode to highlight line about point (HL on modeline).

If ARG is null, toggle global highline mode.
If ARG is a number and is greater than zero, turn on
global highline mode; otherwise, turn off global highline mode.
Only useful with a windowing system.

\(fn &optional ARG)" t nil)

(autoload 'highline-mode "highline/highline" "\
Toggle local minor mode to highlight the line about point (hl on modeline).

If ARG is null, toggle local highline mode.
If ARG is a number and is greater than zero, turn on
local highline mode; otherwise, turn off local highline mode.
Only useful with a windowing system.

\(fn &optional ARG)" t nil)

(autoload 'highline-view-mode "highline/highline" "\
Toggle indirect mode to highlight current line in buffer (Ihl on modeline).

If ARG is null, toggle indirect highline mode.
If ARG is a number and is greater than zero, turn on
indirect highline mode; otherwise, turn off indirect highline mode.
Only useful with a windowing system.

Indirect highline (`highline-view-mode') is useful when you wish
to have various \"visions\" of the same buffer.

Indirect highline uses an indirect buffer to get the \"vision\" of the buffer.
So, if you kill an indirect buffer, the base buffer is not affected; if you
kill the base buffer, all indirect buffer related with the base buffer is
automagically killed.  Also, any text insertion/deletion in any indirect or base
buffer is updated in all related buffers.

See `highline-view-prefix'.

\(fn &optional ARG)" t nil)

(autoload 'highline-split-window-vertically "highline/highline" "\
Split window vertically then turn on indirect highline mode.

See `split-window-vertically' for explanation about ARG and for
documentation.

See also `highline-view-mode' for documentation.

\(fn &optional ARG)" t nil)

(autoload 'highline-split-window-horizontally "highline/highline" "\
Split window horizontally then turn on indirect highline mode.

See `split-window-horizontally' for explanation about ARG and for
documentation.

See also `highline-view-mode' for documentation.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "idle-highlight-mode/idle-highlight-mode" "idle-highlight-mode/idle-highlight-mode.el"
;;;;;;  (21735 13337 63269 59000))
;;; Generated autoloads from idle-highlight-mode/idle-highlight-mode.el

(autoload 'idle-highlight-mode "idle-highlight-mode/idle-highlight-mode" "\
Idle-Highlight Minor Mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "js2-mode/js2-imenu-extras" "js2-mode/js2-imenu-extras.el"
;;;;;;  (21737 30256 369937 32000))
;;; Generated autoloads from js2-mode/js2-imenu-extras.el

(autoload 'js2-imenu-extras-setup "js2-mode/js2-imenu-extras" "\


\(fn)" nil nil)

(autoload 'js2-imenu-extras-mode "js2-mode/js2-imenu-extras" "\
Toggle Imenu support for frameworks and structural patterns.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "js2-mode/js2-mode" "js2-mode/js2-mode.el"
;;;;;;  (21737 30256 373270 365000))
;;; Generated autoloads from js2-mode/js2-mode.el

(autoload 'js2-minor-mode "js2-mode/js2-mode" "\
Minor mode for running js2 as a background linter.
This allows you to use a different major mode for JavaScript editing,
such as `js-mode', while retaining the asynchronous error/warning
highlighting features of `js2-mode'.

\(fn &optional ARG)" t nil)

(autoload 'js2-mode "js2-mode/js2-mode" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "markdown-mode/markdown-mode" "markdown-mode/markdown-mode.el"
;;;;;;  (21737 31540 736595 552000))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode/markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multi-web-mode/multi-web-mode" "multi-web-mode/multi-web-mode.el"
;;;;;;  (21735 13114 786603 803000))
;;; Generated autoloads from multi-web-mode/multi-web-mode.el

(autoload 'multi-web-mode "multi-web-mode/multi-web-mode" "\
Enables the multi web mode chunk detection and indentation

\(fn &optional ARG)" t nil)

(defvar multi-web-global-mode nil "\
Non-nil if Multi-Web-Global mode is enabled.
See the command `multi-web-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `multi-web-global-mode'.")

(custom-autoload 'multi-web-global-mode "multi-web-mode/multi-web-mode" nil)

(autoload 'multi-web-global-mode "multi-web-mode/multi-web-mode" "\
Toggle Multi-Web mode in all buffers.
With prefix ARG, enable Multi-Web-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Multi-Web mode is enabled in all buffers where
`multi-web-mode-maybe' would do it.
See `multi-web-mode' for more information on Multi-Web mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "nginx-mode/nginx-mode" "nginx-mode/nginx-mode.el"
;;;;;;  (21737 34325 999911 223000))
;;; Generated autoloads from nginx-mode/nginx-mode.el

(autoload 'nginx-mode "nginx-mode/nginx-mode" "\
Major mode for highlighting nginx config files.

The variable nginx-indent-level controls the amount of indentation.
\\{nginx-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("nginx.conf$" . nginx-mode) '("/etc/nginx/.*" . nginx-mode))

;;;***

;;;### (autoloads nil "php-mode/php-mode" "php-mode/php-mode.el"
;;;;;;  (21735 10618 3286 303000))
;;; Generated autoloads from php-mode/php-mode.el

(let ((loads (get 'php 'custom-loads))) (if (member '"php-mode/php-mode" loads) nil (put 'php 'custom-loads (cons '"php-mode/php-mode" loads))))

(defvar php-extra-constants 'nil "\
A list of additional strings to treat as PHP constants.")

(custom-autoload 'php-extra-constants "php-mode/php-mode" nil)

(add-to-list 'interpreter-mode-alist (cons "php" 'php-mode))

(autoload 'php-mode "php-mode/php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

(dolist (pattern '("\\.php[s345t]?\\'" "\\.phtml\\'" "Amkfile" "\\.amk$")) (add-to-list 'auto-mode-alist `(,pattern . php-mode) t))

;;;***

;;;### (autoloads nil "pkgbuild-mode/pkgbuild-mode" "pkgbuild-mode/pkgbuild-mode.el"
;;;;;;  (21737 29963 623272 221000))
;;; Generated autoloads from pkgbuild-mode/pkgbuild-mode.el

(autoload 'pkgbuild-mode "pkgbuild-mode/pkgbuild-mode" "\
Major mode for editing PKGBUILD files. This is much like shell-script-mode mode.
 Turning on pkgbuild mode calls the value of the variable `pkgbuild-mode-hook'
with no args, if that value is non-nil.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("/PKGBUILD\\'" . pkgbuild-mode))

;;;***

;;;### (autoloads nil "sbt-mode/sbt-mode" "sbt-mode/sbt-mode.el"
;;;;;;  (21735 13505 46601 328000))
;;; Generated autoloads from sbt-mode/sbt-mode.el

(autoload 'sbt-start "sbt-mode/sbt-mode" "\
Start sbt

\(fn)" t nil)

(autoload 'run-scala "sbt-mode/sbt-mode" "\
Pop up Scala REPL buffer.

If the sbt buffer is not in REPL mode, it will switch to REPL mode (console).

\(fn)" t nil)

(autoload 'sbt-command "sbt-mode/sbt-mode" "\
Send a command to the sbt process of the current buffer's sbt project.
Prompts for the command to send when in interactive mode. You can
use tab completion.

This command does the following:
  - displays the buffer without moving focus to it
  - erases the buffer
  - forgets about compilation errors

The command is most usefull for running a compilation command
that outputs errors.

\(fn COMMAND)" t nil)

(autoload 'sbt-run-previous-command "sbt-mode/sbt-mode" "\
Repeat the command that was previously executed (or run the
sbt:default-command, if no other command has yet been run).

\(fn)" t nil)

;;;***

;;;### (autoloads nil "sbt-mode/sbt-mode-rgrep" "sbt-mode/sbt-mode-rgrep.el"
;;;;;;  (21735 13505 46601 328000))
;;; Generated autoloads from sbt-mode/sbt-mode-rgrep.el

(autoload 'sbt-grep "sbt-mode/sbt-mode-rgrep" "\
Recursively grep for REGEXP in FILES in directory tree rooted at DIR. By default DIR is is the sbt project root.

\(fn REGEXP &optional FILES DIR CONFIRM)" t nil)

(autoload 'sbt-find-usages "sbt-mode/sbt-mode-rgrep" "\
Recursively grep for ID in scala files in directory tree rooted at DIR. By default DIR is is the sbt project root.

\(fn ID &optional DIR CONFIRM)" t nil)

(autoload 'sbt-find-definitions "sbt-mode/sbt-mode-rgrep" "\
Recursively grep for definition of ID in scala files in the directory tree rooted at the sbt project root.

\(fn ID &optional CONFIRM)" t nil)

;;;***

;;;### (autoloads nil "scala-mode2/scala-mode2" "scala-mode2/scala-mode2.el"
;;;;;;  (21735 13427 463268 486000))
;;; Generated autoloads from scala-mode2/scala-mode2.el

(autoload 'scala-mode:set-scala-syntax-mode "scala-mode2/scala-mode2" "\
Sets the syntax-table and other realted variables for the current buffer to those of scala-mode. Can be used to make some other major mode (such as sbt-mode) use scala syntax-table.

\(fn)" nil nil)

(autoload 'scala-mode "scala-mode2/scala-mode2" "\
Major mode for editing scala code.

When started, runs `scala-mode-hook'. 

\\{scala-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.\\(scala\\|sbt\\)\\'" . scala-mode))

(modify-coding-system-alist 'file "\\.\\(scala\\|sbt\\)\\'" 'utf-8)

;;;***

;;;### (autoloads nil "textmate/textmate" "textmate/textmate.el"
;;;;;;  (21737 31718 853261 90000))
;;; Generated autoloads from textmate/textmate.el

(defvar textmate-mode nil "\
Non-nil if Textmate mode is enabled.
See the command `textmate-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `textmate-mode'.")

(custom-autoload 'textmate-mode "textmate/textmate" nil)

(autoload 'textmate-mode "textmate/textmate" "\
TextMate Emulation Minor Mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "web-mode/web-mode" "web-mode/web-mode.el"
;;;;;;  (21735 12991 583271 250000))
;;; Generated autoloads from web-mode/web-mode.el

(autoload 'web-mode "web-mode/web-mode" "\
Major mode for editing web templates.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "yafolding/yafolding" "yafolding/yafolding.el"
;;;;;;  (21737 39294 73213 51000))
;;; Generated autoloads from yafolding/yafolding.el

(defvar yafolding-mode-map (let ((map (make-sparse-keymap))) (define-key map (kbd "<C-S-return>") #'yafolding-hide-parent-element) (define-key map (kbd "<C-M-return>") #'yafolding-toggle-all) (define-key map (kbd "<C-return>") #'yafolding-toggle-element) map))

(autoload 'yafolding-mode "yafolding/yafolding" "\
Toggle yafolding mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "yaml-mode/yaml-mode" "yaml-mode/yaml-mode.el"
;;;;;;  (21737 40792 549870 214000))
;;; Generated autoloads from yaml-mode/yaml-mode.el

(let ((loads (get 'yaml 'custom-loads))) (if (member '"yaml-mode/yaml-mode" loads) nil (put 'yaml 'custom-loads (cons '"yaml-mode/yaml-mode" loads))))

(autoload 'yaml-mode "yaml-mode/yaml-mode" "\
Simple mode to edit YAML.

\\{yaml-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;;;***

;;;### (autoloads nil "yasnippet/yasnippet" "yasnippet/yasnippet.el"
;;;;;;  (21735 5994 333315 626000))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("auto-complete/auto-complete-pkg.el" "bookmark+/bookmark+-chg.el"
;;;;;;  "bookmark+/bookmark+-doc.el" "bookmark+/bookmark+-key.el"
;;;;;;  "cedet/cedet-build.el" "cedet/cedet-devel-load.el" "cedet/cedet-ediff.el"
;;;;;;  "cedet/cedet-emacs-merge.el" "cedet/cedet-remove-builtin.el"
;;;;;;  "cedet/cedet-update-changelog.el" "cedet/cedet-update-version.el"
;;;;;;  "clang-complete-async/auto-complete-clang-async.el" "company-mode/company-capf.el"
;;;;;;  "company-mode/company-clang.el" "company-mode/company-cmake.el"
;;;;;;  "company-mode/company-eclim.el" "company-mode/company-ropemacs.el"
;;;;;;  "company-mode/company-template.el" "company-mode/company-tests.el"
;;;;;;  "deferred/concurrent-sample.el" "deferred/concurrent.el"
;;;;;;  "deferred/deferred-samples.el" "deferred/deferred.el" "deferred/test-concurrent.el"
;;;;;;  "deferred/test-deferred.el" "fuzzy/fuzzy.el" "go-mode/go-mode-autoloads.el"
;;;;;;  "multi-web-mode/mweb-example-config.el" "php-mode/php-mode-test.el"
;;;;;;  "popup/popup.el" "qml-mode/qml-mode.el" "request/request-deferred.el"
;;;;;;  "request/request.el" "sbt-mode/sbt-mode-buffer.el" "sbt-mode/sbt-mode-comint.el"
;;;;;;  "sbt-mode/sbt-mode-pkg.el" "sbt-mode/sbt-mode-project.el"
;;;;;;  "scala-mode2/scala-mode2-fontlock.el" "scala-mode2/scala-mode2-imenu.el"
;;;;;;  "scala-mode2/scala-mode2-indent.el" "scala-mode2/scala-mode2-lib.el"
;;;;;;  "scala-mode2/scala-mode2-map.el" "scala-mode2/scala-mode2-paragraph.el"
;;;;;;  "scala-mode2/scala-mode2-pkg.el" "scala-mode2/scala-mode2-sbt.el"
;;;;;;  "scala-mode2/scala-mode2-syntax.el" "yasnippet/yasnippet-debug.el"
;;;;;;  "yasnippet/yasnippet-tests.el" "yasnippets/yasnippets.el")
;;;;;;  (21737 43906 586809 999000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
