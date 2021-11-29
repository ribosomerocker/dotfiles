;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(setq display-line-numbers-width-start t
      scroll-step 1
      scroll-margin 8)
(tool-bar-mode -1)
(set-cursor-color "#ffffff")
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode -1)
(display-line-numbers-mode 1)
(global-display-line-numbers-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(misterioso))
 '(package-selected-packages
   '(company slime telephone-line auto-package-update sublimity undo-fu evil goto-chg)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 143 :width normal)))))

(use-package auto-package-update
             :config
             (setq auto-package-update-delete-old-versions t
                   auto-package-update-hide-results t)
             (auto-package-update-maybe))

(use-package undo-fu)

(use-package evil
             :config
             (evil-mode 1)
             (evil-set-undo-system 'undo-fu)
             (define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
             (define-key evil-normal-state-map (kbd "C-c C-c") 'evil-normal-state))

(use-package telephone-line
  :config
  (setq telephone-line-lhs
	'((evil   . (telephone-line-evil-tag-segment))
	  (accent . (telephone-line-vc-segment
		     telephone-line-erc-modified-channels-segment
		     telephone-line-process-segment))
	  (nil    . (telephone-line-minor-mode-segment
		     telephone-line-buffer-segment)))
        telephone-line-rhs
	'((nil    . (telephone-line-misc-info-segment))
	  (accent . (telephone-line-major-mode-segment))
	  (evil   . (telephone-line-airline-position-segment))))
  (telephone-line-mode 1))

(use-package slime
  :config
  (setq inferior-lisp-program "sbcl"))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))
