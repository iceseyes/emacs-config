(provide 'setup_files)

;; Web files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm?\\'" . web-mode))

;; Dockerfile-mode
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Yaml Mode
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
