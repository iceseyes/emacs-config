(provide 'setup_snippets)

(defun autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/emacs-config/snippets/")))

(yas-reload-all)
(auto-insert-mode)

(setq auto-insert-directory "~/.emacs.d/emacs-config/snippets/templates/")
(define-auto-insert "\\.\\([Hh]\\|hh\\|hpp\\)\\'" ["cpp-template.hpp" autoinsert-yas-expand])
(define-auto-insert "\\.\\([Cc]\\|cc\\|cpp\\)\\'" ["cpp-template.cpp" autoinsert-yas-expand])
