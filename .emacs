;;;
;;; Put ~./emacs.d/site-lisp at the beginning of load-path
;;;
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
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq c-basic-offset 4)

;;;
;;; Utility functions
;;;

(defun ident-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


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


;;;
;;; Enable on the fly syntax check
;;;
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list 
                            "/usr/local/include"
                            "/usr/local/include/OGRE"
                            "/usr/local/include/OGRE/Overlay"
                            "/usr/include/ois"
                            "usr/local/share/OGRE/samples/Common/include"
                            ))))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-standard-library "libc++")))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++11")))


