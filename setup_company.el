(provide 'setup_company)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0)
(setq company-backends
      (delete 'company-semantic company-backends))

(eval-after-load 'company
  '(add-to-list
    'company-backends
    '(company-irony-c-headers company-irony company-rtags)))

(eval-after-load 'company
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

(add-hook
 'irony-mode-hook
 'company-irony-setup-begin-commands)
