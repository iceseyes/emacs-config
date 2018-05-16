(provide 'setup_rust)

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook  #'racer-mode)
(add-hook 'rust-mode-hook  #'cargo-minor-mode)
(add-hook 'rust-mode-hook  #'flycheck-mode)

(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
