(provide 'setup_rust)

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook  #'racer-mode)
(add-hook 'rust-mode-hook  #'cargo-minor-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
