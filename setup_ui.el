(provide 'setup_ui)

;; Setup Theme
(load-theme 'manoj-dark t)

;; No Startup Screen
(setq inhibit-startup-screen t)

;; Paren mode (show brackets!)
(show-paren-mode t)

;; No Toolbar, this is emacs and you have 10 fingers!
(tool-bar-mode -1)

;; Setup Emacs Window
(when window-system
  (set-frame-size (selected-frame) 180 50)
  (set-frame-position (selected-frame) 80 50))

;; force to open new buffers (build/run...) horizontally
(setq split-height-threshold 20)
(setq split-width-threshold 80)

;; force compilation scrolling
(setq compilation-scroll-output t)

;; Enable Line Numbers Mode
(global-linum-mode)

;; try to reuse current buffers
(setq-default display-buffer-reuse-frames t)
