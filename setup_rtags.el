(provide 'setup_rtags)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)

(setq rtags-completions-enabled t)
(rtags-enable-standard-keybindings)

;; Start RDM Server
(add-hook 'find-file-hook 'rtags-start-process-maybe)
