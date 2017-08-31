(provide 'emacs-config)

(setq package-selected-packages
   (quote
    (markdown-mode flycheck-pos-tip flycheck-color-mode-line flycheck-irony less-css-mode web-mode iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights rust-mode magit use-package rtags helm-projectile helm-gitignore helm-git helm-flycheck company-irony-c-headers company-irony irony clang-format dockerfile-mode yaml-mode flycheck-rtags helm-rtags company-rtags ac-rtags)))

(require 'setup_ui)
(require 'setup_package_system)
(require 'old.emacs)
