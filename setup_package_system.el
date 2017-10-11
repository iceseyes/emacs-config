;; Setup packaging system
(provide 'setup_package_system)

;; Add here packages to install. Then add a line with use-package
;; (see below)
(setq package-selected-packages
      (quote
       (markdown-mode flycheck-pos-tip flycheck-color-mode-line flycheck-irony less-css-mode web-mode iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights rust-mode magit use-package rtags company-irony-c-headers company-irony irony clang-format dockerfile-mode yaml-mode flycheck-rtags  company-rtags ac-rtags js2-mode pyvenvi cmake-mode cmake-font-lock counsel powerline npm-mode web-beautify company-tern company-jedi projectile neotree rust-mode flycheck-rust racer cargo)))

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

;; Use these packages

;; Common-Lisp
(use-package cl)

;; rtags for c/c++
(use-package rtags)

;; projectile
(use-package projectile)

;; neotree
(use-package neotree)

;; Company-mode
(use-package company)
(use-package company-irony)
(use-package company-irony-c-headers)
(use-package company-rtags)
(use-package company-tern)  ;; needs: npm -g install tern
(use-package company-jedi)

;; flycheck
(use-package flycheck-irony)
(use-package flycheck-color-mode-line)
(use-package flycheck-pos-tip)
(use-package flycheck-rtags)
;;(use-package flycheck-rust)

;; ivy
(use-package counsel)
(use-package counsel-projectile)
(use-package ivy-rtags)

;; Powerline
(use-package powerline)

;; Python mode
(use-package pyvenv)
(use-package elpy)

;; Web mode
(use-package web-mode)
(use-package less-css-mode)
(use-package js2-mode)
(use-package npm-mode)
(use-package web-beautify)  ;; needs: npm -g install js-beautify

;; Clang format
(use-package clang-format)

;; Dockerfile mode
(use-package dockerfile-mode)

;; Yaml
(use-package yaml-mode)

;; Cmake
(use-package cmake-mode)
(use-package cmake-font-lock)

;; Rust
;; (use-package rust-mode)
;; (use-package racer)
;; (use-package cargo)

;; Highlights undo, yank, search...
(use-package volatile-highlights
  :init
  (volatile-highlights-mode t))

;; Use undo/redo in tree mode (like vim) and not as linear sequence
(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

;; Snippets
(use-package yasnippet
  :defer t
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode))

;; Emacs extension for clean auto-indent and backspace unindent
;; An auto-indent function (RET) that takes care to delete any unused white spaces
;; An unindent function (M-backspace) that aligns the cursor position to match
;; indentation of best candidate from lines above
(use-package clean-aindent-mode
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

;; an unobtrusive way to trim spaces from end of line
(use-package ws-butler
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'text-mode 'ws-butler-mode)
  (add-hook 'fundamental-mode 'ws-butler-mode))

;; allows you to edit one occurrence of some text in a buffer (possibly narrowed)
;; or region, and simultaneously have other occurrences edited in the same way,
;; with visual feedback as you type.
(use-package iedit
  :bind (("C-;" . iedit-mode))
  :init
  (setq iedit-toggle-key-default nil))

;; Enable Markdown support
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Import some module
(require 'ivy-rtags)
(require 'company-rtags)
(require 'flycheck-rtags)
