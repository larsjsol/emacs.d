;;
;; Put ~./emacs.d/site-lisp at the beginning of load-path
;;
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

;;;
;;; Base customizations
;;;
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;;;
;;; Enable rainbow-delimiters when programming
;;;
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;;
;;; Always nyan.cat
;;;
(require 'nyan-mode)
(setq nyan-wavy-trail t)
(nyan-mode)
(nyan-start-animation)
