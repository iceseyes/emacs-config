;; Setup packaging system
(provide 'setup_package_system)

;; Add here packages to install. Then add a line with use-package
;; (see below)
(setq package-selected-packages
      (quote
       (markdown-mode flycheck-pos-tip flycheck-color-mode-line flycheck-irony less-css-mode web-mode iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights rust-mode magit use-package rtags helm-projectile helm-gitignore helm-git helm-flycheck company-irony-c-headers company-irony irony clang-format dockerfile-mode yaml-mode flycheck-rtags helm-rtags company-rtags ac-rtags)))

;; Load Package module
(require 'package)

;; Setup repositories
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/")))

;; Initialize packages
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

;; install use-package if necessary
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; load use-package
(require 'use-package)
(setq use-package-always-ensure t)

;; Use this packages
(use-package company)
(use-package helm)
(use-package helm-css-scss)
(use-package cl)
(use-package rtags)
(use-package helm-rtags)
(use-package company-irony-c-headers)
(use-package company-rtags)
(use-package helm-projectile)
(use-package projectile-speedbar)
(use-package flycheck-irony)
(use-package flycheck-color-mode-line)
(use-package flycheck-pos-tip)
(use-package flycheck-rtags)
(use-package helm-flycheck)
(use-package elpy)
(use-package web-mode)
(use-package less-css-mode)
(use-package clang-format)
(use-package dockerfile-mode)
(use-package yaml-mode)
(use-package volatile-highlights
  :init
  (volatile-highlights-mode t))
(use-package undo-tree
  :init
  (global-undo-tree-mode 1))
(use-package yasnippet
  :defer t
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode))
(use-package clean-aindent-mode
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))
(use-package dtrt-indent
  :init
  (dtrt-indent-mode 1)
  (setq dtrt-indent-verbosity 0))
(use-package ws-butler
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'text-mode 'ws-butler-mode)
  (add-hook 'fundamental-mode 'ws-butler-mode))
(use-package anzu
  :init
  (global-anzu-mode)
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))
(use-package iedit
  :bind (("C-;" . iedit-mode))
  :init
  (setq iedit-toggle-key-default nil))
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(require 'helm-rtags)
(require 'company-rtags)
(require 'flycheck-rtags)
(require 'helm-config)
