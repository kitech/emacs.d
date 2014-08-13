emacs 24.1正式发布，却不料原来在23.2上用的很好的ecb无法使用了

经过检查报错信息，搜索资料，查证得到如下解决办法：

1、需要在加载ecb之前，设置一个变量：

     (setq stack-trace-on-error t)

这次查找问题，学到几个elisp函数，

(run-with-idle-timer 0.1 nil 'toggle-full-screen)

(add-hook 'after-make-frame-functions 'toggle-full-screen)


