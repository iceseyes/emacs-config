(provide 'setup_helm)

;; Use curl for google requests
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; Helm Configurations
(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t
      helm-M-x-fuzzy-match                  t
      helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t
      helm-apropos-fuzzy-match              t
      helm-autoresize-max-height            0
      helm-autoresize-min-height           20)

;; Activate Helm
(helm-autoresize-mode 1)
(helm-mode 1)
