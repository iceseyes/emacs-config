(provide 'setup_flycheck)

(setq flycheck-check-syntax-automatically
      '(mode-enabled save new-line idle-change))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
