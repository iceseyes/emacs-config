(provide 'setup_projectile)

;; Projectile
(projectile-mode)
(counsel-projectile-on)

(setq projectile-enable-caching t)
(setq projectile-project-compilation-cmd "")
(setq projectile-project-test-cmd "")
(setq projectile-project-run-cmd "")

(projectile-register-project-type 'npm '("package.json")
                                  :compile "npm install"
                                  :test "npm test"
                                  :run "npm start"
                                  :test-suffix ".spec")
