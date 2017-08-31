(provide 'setup_helm)

;; Use curl for google requests
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; Helm Configurations
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t
      helm-M-x-fuzzy-match                  t ; optional fuzzy matching for helm-M-x
      helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t
      helm-apropos-fuzzy-match              t
      helm-autoresize-max-height            0
      helm-autoresize-min-height           20)

;; Activate Helm
(helm-autoresize-mode 1)
(helm-mode 1)
