(provide 'setup_projectile)

;; Projectile
(projectile-mode)
;;(counsel-projectile-mode)

(setq projectile-enable-caching t)
(setq projectile-project-compilation-cmd "")
(setq projectile-project-test-cmd "")
(setq projectile-project-run-cmd "")

(projectile-register-project-type 'npm '("package.json")
                                  :compile "npm install"
                                  :test "npm test"
                                  :run "npm start"
                                  :test-suffix ".spec")

(projectile-register-project-type 'cargo '("cargo.toml")
                                  :compile "cargo build"
                                  :test "cargo test"
                                  :run "cargo run"
                                  :test-suffix ".spec")

;; neotree
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq counsel-projectile-switch-project-action '(1 ("d" counsel-projectile-find-dir-action "open root")))

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))
