(provide 'setup_company)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0)
(setq company-backends
      (delete 'company-semantic company-backends))
(setq company-backends
      (delete 'company-clang company-backends))


(eval-after-load 'company
  '(add-to-list
    'company-backends
    '(company-irony-c-headers company-irony company-rtags company-tern company-jedi)))

(eval-after-load 'company
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

(add-hook
 'irony-mode-hook
 'company-irony-setup-begin-commands)

(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))

(add-hook
 'meson-mode-hook
 'company-mode)
