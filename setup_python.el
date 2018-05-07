(provide 'setup_python)
;; You have to install this python packages
;; pip install rope jedi flake8 importmagic

(elpy-enable)
(setq elpy-rpc-ignored-buffer-size 1200000)
(setq elpy-rpc-python-command "python3")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
