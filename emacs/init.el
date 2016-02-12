(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(load-theme 'wombat t)
(setq indent-tabs-mode t)
(setq inhibit-startup-message t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'use-package)

(use-package neotree
  :bind ("<f8>" . neotree-toggle))

(use-package typescript-mode
  :defer t
  :init
  (add-hook 'typescript-mode-hook
	    (lambda()
	      (tide-setup)
	      (flycheck-mode +1)
	      (eldoc-mode +1)
	      (company-mode +1))))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
	  (lambda ()
	    (when (string-equal "tsx" (file-name-extension buffer-file-name))
	      (tide-setup)
	      (flycheck-mode +1)
	      (eldoc-mode +1)
	      (company-mode +1))))

(use-package js2-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
    (use-package tern-auto-complete
      :init (progn
	      (add-hook 'js2-mode-hook 'tern-mode)
	      (add-hook 'js2-mode-hook 'auto-complete-mode))
      :config (tern-ac-setup))
    (use-package flycheck
        :init (add-hook 'js2-mode-hook 'flycheck-mode))))

(use-package ace-jump-mode
  :defer t
  :ensure t
    :bind ("C-o" . ace-jump-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
