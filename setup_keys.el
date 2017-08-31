(provide 'setup_keys)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

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
