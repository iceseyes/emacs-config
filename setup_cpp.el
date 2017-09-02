(provide 'setup_cpp)

;; Reformat buffer if .clang-format exists in the projectile root.
(defun clang-format-buffer-smart ()
  (when
      (and
       (file-exists-p (expand-file-name ".clang-format" (projectile-project-root)))
       (member
        (file-name-extension (file-name-nondirectory (buffer-file-name)))
        '("cpp" "cc" "c" "C" "cxx" "h" "hpp" "hh" "hxx")))
    (clang-format-buffer)))

(c-add-style "mb-style"
             '("stroustrup"
               (c-basic-offset . 4)
               (c-offsets-alist (innamespace . 0))))

(setq c-default-style "mb-style")
(setq clang-format-style-option "google")

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook 'my-flycheck-rtags-setup)

(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Add automatic clang-format on save only when .clang-format is defined
;; in project(ile) root.
(add-hook 'c++-mode-hook
          (lambda()
            (add-hook 'before-save-hook 'clang-format-buffer-smart)))

;; Setup cpputils-cmake
(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )))

(setq cppcm-build-dirname "build/Debug")
