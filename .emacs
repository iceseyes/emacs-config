;; Setup Emacs Window
(when window-system
  (set-frame-size (selected-frame) 160 50)
  (set-frame-position (selected-frame) 80 50))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (markdown-mode flycheck-pos-tip flycheck-color-mode-line flycheck-irony less-css-mode web-mode iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights rust-mode magit use-package rtags helm-projectile helm-gitignore helm-git helm-flycheck company-irony-c-headers company-irony irony clang-format dockerfile-mode yaml-mode)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; force to open new buffers (build/run...) horizontally
(setq split-height-threshold 0)
(setq split-width-threshold nil)

;; force compilation scrolling
(setq compilation-scroll-output t)

;; Enable linum-mode
(global-linum-mode)

;; Setup packaging system
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
;;(setq company-backends (delete 'company-clang company-backends))

;; Helm Config
(use-package helm)
(use-package helm-css-scss)
(use-package cl)
(use-package rtags)
(use-package company-irony-c-headers)
(use-package helm-projectile)
(use-package projectile-speedbar)
(use-package flycheck-irony)
(use-package helm-flycheck)
(use-package flycheck-color-mode-line)
(use-package flycheck-pos-tip)
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
(require 'rtags-helm)
(require 'company-rtags)
(require 'flycheck-rtags)
(require 'helm-config)


;; Use curl for google requests
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; Helm Configurations
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t
      helm-M-x-fuzzy-match                  t ; optional fuzzy matching for helm-M-x
      helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t
      helm-apropos-fuzzy-match              t
      helm-autoresize-max-height            0
      helm-autoresize-min-height           20)

;; Activate Helm
(helm-autoresize-mode 1)
(helm-mode 1)

;; Projectile
(projectile-mode)

;; Elpy
(elpy-enable) ;; install pip install rope jedi flake8 importmagic

;; GDB
(setq gdb-show-main t)
(setq-default display-buffer-reuse-frames t)

;; C/C++
(c-add-style "mb-style"
             '("stroustrup"
               (c-basic-offset . 4)
               (c-offsets-alist (innamespace . 0))))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq projectile-enable-caching t)
(setq c-default-style "mb-style")
(setq rtags-completions-enabled t
      rtags-autostart-diagnostics t
      rtags-use-helm t)
(setq company-idle-delay 0)
(setq flycheck-check-syntax-automatically '(mode-enabled save new-line idle-change))
(setq clang-format-style-option "google")

(setq web-mode-engines-alist '(("django" . "\\.html\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)

(setq elpy-rpc-ignored-buffer-size 1200000)

(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      kill-ring-max 5000 ; increase kill-ring capacity
      kill-whole-line t  ; if NIL, kill whole line and move the next line up
      )

;; Dockerfile-mode
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Yaml Mode
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; use space to indent by default
(setq-default indent-tabs-mode nil
              tab-width 4)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(delete-selection-mode)

;; Reformat buffer if .clang-format exists in the projectile root.
(defun clang-format-buffer-smart ()
  (when
      (and
       (file-exists-p (expand-file-name ".clang-format" (projectile-project-root)))
       (member
        (file-name-extension (file-name-nondirectory (buffer-file-name)))
        '("cpp" "cc" "c" "C" "cxx" "h" "hpp" "hh" "hxx")))                                         
    (clang-format-buffer)))


;; autoinsert C/C++ header
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'" "Basic C/C++ header")
  '(nil
     "/**\n"
     " * @file: " (file-name-nondirectory buffer-file-name) "\n"
     " *\n"
     " *  created on: " (format-time-string "%e %B %Y") "\n"
     " *      author: Massimo Bianchi <bianchi.massimo@gmail.com>\n"
     " */\n"
     "\n\n"
    (let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
           (nopath (file-name-nondirectory noext))
           (ident (concat "__" (upcase nopath) "_" (upcase (file-name-extension buffer-file-name)) "__")))
      (concat "#ifndef " ident "\n"
              "#define " ident  "\n\n\n"
              "\n\n#endif /* " ident " */\n"))
    ))

;; auto insert C/C++
(define-auto-insert
  (cons "\\.\\([Cc]\\|cc\\|cpp\\)\\'" "Basic C++ implementation")
  '(nil
    "/**\n"
    " * @file: " (file-name-nondirectory buffer-file-name) "\n"
    " *\n"
    " *  created on: " (format-time-string "%e %B %Y") "\n"
    " *      author: Massimo Bianchi <bianchi.massimo@gmail.com>\n"
    " */\n"
    "\n\n"
    ))

;; Customized functions
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil)) ;; RTags creates more accurate overlays.

(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single
line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single
  line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; kill a line, including whitespace characters until next non-whiepsace character
;; of next line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))

;; taken from prelude-editor.el
;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes
  '(LaTeX-mode TeX-mode)
  "Modes in which to indent regions that are yanked (or yank-popped).
Only modes that don't derive from `prog-mode' should be listed here.")

(defvar yank-indent-blacklisted-modes
  '(python-mode slim-mode haml-mode)
  "Modes for which auto-indenting is suppressed.")

(defvar yank-advised-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur.")

(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large."
  (if (<= (- end beg) yank-advised-indent-threshold)
      (indent-region beg end nil)))

(defadvice yank (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes,
indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (not (member major-mode yank-indent-blacklisted-modes))
           (or (derived-mode-p 'prog-mode)
               (member major-mode yank-indent-modes)))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of `yank-indent-modes',
indent yanked text (with prefix arg don't indent)."
  (when (and (not (ad-get-arg 0))
             (not (member major-mode yank-indent-blacklisted-modes))
             (or (derived-mode-p 'prog-mode)
                 (member major-mode yank-indent-modes)))
    (let ((transient-mark-mode nil))
      (yank-advised-indent-function (region-beginning) (region-end)))))

;; prelude-core.el
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

;; prelude-editing.el
(defcustom prelude-indent-sensitive-modes
  '(coffee-mode python-mode slim-mode haml-mode yaml-mode)
  "Modes for which auto-indenting is suppressed."
  :type 'list)

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (unless (member major-mode prelude-indent-sensitive-modes)
    (save-excursion
      (if (region-active-p)
          (progn
            (indent-region (region-beginning) (region-end))
            (message "Indented selected region."))
        (progn
          (indent-buffer)
          (message "Indented buffer.")))
      (whitespace-cleanup))))

(global-set-key (kbd "C-c i") 'indent-region-or-buffer)

;; add duplicate line function from Prelude
;; taken from prelude-core.el
(defun prelude-get-positions-of-line-or-region ()
  "Return positions (beg . end) of the current line
or region."
  (let (beg end)
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (cons beg end)))

;; smart openline
(defun prelude-smart-open-line (arg)
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode.
With a prefix ARG open line above the current line."
  (interactive "P")
  (if arg
      (prelude-smart-open-line-above)
    (progn
      (move-end-of-line nil)
      (newline-and-indent))))

(defun prelude-smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun go_next_window ()
  "Moves on the next window."
  (interactive)
  (other-window 1))

(defun go_prev_window ()
  "Moves on the next window."
  (interactive)
  (other-window -1))

;; Active auto bracketing
(electric-pair-mode 1)
(auto-insert-mode 1)


;; keybindings

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

; Global Helm Bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

;; Set local keybind map for css-mode / scss-mode / less-css-mode
(dolist ($hook '(css-mode-hook scss-mode-hook less-css-mode-hook))
  (add-hook
   $hook (lambda ()
           (local-set-key (kbd "s-i") 'helm-css-scss)
           (local-set-key (kbd "s-I") 'helm-css-scss-back-to-last-point))))

(global-set-key (kbd "C-S-n") 'projectile-find-file)
(global-set-key (kbd "C-<tab>") 'projectile-find-other-file)
(global-set-key (kbd "M-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "M-S-b") 'projectile-switch-to-buffer-other-window)
(global-set-key (kbd "C-<f10>") 'projectile-test-project)
(global-set-key (kbd "<f2>") 'projectile-speedbar-open-current-buffer-in-tree)

(global-unset-key (kbd "C-c r ."))
(global-unset-key (kbd "C-c r ["))

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))
(global-set-key (kbd "C-B") 'projectile-compile-project)
(global-set-key (kbd "<f10>") 'projectile-run-project)

(global-set-key (kbd "C-<next>") 'go_next_window)
(global-set-key (kbd "C-<prior>") 'go_prev_window)
(global-set-key (kbd "M-o") 'prelude-smart-open-line)
(global-set-key (kbd "M-o") 'open-line)
(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)
(global-set-key (kbd "M-;") 'comment-dwim-2)
(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-S-f") 'clang-format-buffer)

(rtags-enable-standard-keybindings)

(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

(define-key isearch-mode-map (kbd "s-i") 'helm-css-scss-from-isearch)
(define-key helm-css-scss-map (kbd "s-i") 'helm-css-scss-multi-from-helm-css-scss)

(define-key c-mode-map [(?\M-\r)] 'company-complete)
(define-key c++-mode-map [(?\M-\r)] 'company-complete)

(define-key c-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
(define-key c-mode-map (kbd "M-S-.") 'rtags-find-references-at-point)
(define-key c-mode-map (kbd "C-n") 'rtags-find-symbol)
(define-key c-mode-map (kbd "M-n") 'rtags-find-references)
(define-key c-mode-map (kbd "M-N") 'rtags-find-references-current-file)
(define-key c-mode-map (kbd "M-R") 'rtags-rename-symbol)
(define-key c-mode-map (kbd "M-<left>") 'rtags-location-stack-back)
(define-key c-mode-map (kbd "M-<right>") 'rtags-location-stack-forward)

(define-key c++-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
(define-key c++-mode-map (kbd "M-S-.") 'rtags-find-references-at-point)
(define-key c++-mode-map (kbd "C-n") 'rtags-find-symbol)
(define-key c++-mode-map (kbd "M-n") 'rtags-find-references)
(define-key c++-mode-map (kbd "M-N") 'rtags-find-references-current-file)
(define-key c++-mode-map (kbd "M-R") 'rtags-rename-symbol)
(define-key c++-mode-map (kbd "M-<left>") 'rtags-location-stack-back)
(define-key c++-mode-map (kbd "M-<right>") 'rtags-location-stack-forward)

;(define-key c-mode-map   (kbd "C-S-N") 'rtags-find-file)
;(define-key c++-mode-map (kbd "C-S-N") 'rtags-find-file)

(define-key elpy-mode-map (kbd "M-\r") 'elpy-company-backend)
(define-key elpy-mode-map (kbd "M-n") 'elpy-rgrep-symbol)
(define-key elpy-mode-map (kbd "M-<left>") 'pop-tag-mark)
(define-key elpy-mode-map (kbd "C-S-N") 'elpy-find-file)

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony company-rtags)))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(eval-after-load 'company
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook 'my-flycheck-rtags-setup)

(add-hook 'find-file-hook 'rtags-start-process-maybe)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; Add automatic clang-format on save only when .clang-format is defined
;; in project(ile) root.
(add-hook 'c++-mode-hook
          (lambda()
            (add-hook 'before-save-hook 'clang-format-buffer-smart)))

(add-hook 'sh-mode-hook (lambda ()
                          (setq tab-width 4)))

;; show whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
                            (setq-local whitespace-style
                                        '(face
                                          tabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

