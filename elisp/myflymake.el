(defun flymake-display-current-error ()  
  "Display errors/warnings under cursor."  
  (interactive)  
  (let ((ovs (overlays-in (point) (1+ (point)))))  
    (catch 'found  
      (dolist (ov ovs)  
        (when (flymake-overlay-p ov)  
          (message (overlay-get ov 'help-echo))  
          (throw 'found t))))))  
(defun flymake-goto-next-error-disp ()  
  "Go to next error in err ring, then display error/warning."  
  (interactive)  
  (flymake-goto-next-error)  
  (flymake-display-current-error))  
(defun flymake-goto-prev-error-disp ()  
  "Go to previous error in err ring, then display error/warning."  
  (interactive)  
  (flymake-goto-prev-error)  
  (flymake-display-current-error))  
