(provide 'setup_keys)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

;; unbind ivy keys
(global-unset-key (kbd "M-n"))
(global-unset-key (kbd "M-p"))

;; Global
(global-set-key (kbd "C-<next>") 'go_next_window)
(global-set-key (kbd "C-<prior>") 'go_prev_window)

(global-set-key (kbd "C-<left>") 'switch-to-prev-buffer)
(global-set-key (kbd "C-<right>") 'switch-to-next-buffer)

(global-set-key (kbd "C-S-<left>") 'left-word)
(global-set-key (kbd "C-S-<right>") 'right-word)

(global-set-key (kbd "M-o") 'prelude-smart-open-line)
(global-set-key (kbd "M-o") 'open-line)
(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)
(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-S-f") 'clang-format-buffer)

; Global Ivy Bindings
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-n") 'counsel-describe-function)
(global-set-key (kbd "C-x C-S-n") 'counsel-describe-variable)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x C-l") 'counsel-find-library)
(global-set-key (kbd "C-x C-i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Projectile
(global-set-key (kbd "C-S-e") 'projectile-run-eshell)
(global-set-key (kbd "C-S-p") 'projectile-switch-project)
(global-set-key (kbd "C-S-n") 'projectile-find-file)
(global-set-key (kbd "C-<tab>") 'projectile-find-other-file)
(global-set-key (kbd "M-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "M-S-b") 'projectile-switch-to-buffer-other-window)
(global-set-key (kbd "C-B") 'projectile-compile-project)
(global-set-key (kbd "<f10>") 'projectile-run-project)
(global-set-key (kbd "C-<f10>") 'projectile-test-project)
(global-set-key (kbd "<f8>") 'neotree-project-dir)

(global-unset-key (kbd "C-c r ."))
(global-unset-key (kbd "C-c r ["))

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; C/C++
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

;; Python
(define-key elpy-mode-map [(?\M-\r)] 'company-complete)
(define-key elpy-mode-map (kbd "M-n") 'elpy-rgrep-symbol)
(define-key elpy-mode-map (kbd "M-<left>") 'pop-tag-mark)
(define-key elpy-mode-map (kbd "C-S-N") 'elpy-find-file)

;; JS/Web
(define-key js2-mode-map [(?\M-\r)] 'company-complete)

(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-S-f") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-S-f") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-S-f") 'web-beautify-html))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-S-f") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-S-f") 'web-beautify-css))
