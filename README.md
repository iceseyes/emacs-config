# emacs-config
My .emacs

## Install

Clone project into your .emacs.d folder. Than if you don't have a .emacs in your home, create it otherwise just put this lines
into that file:

```
;; We Initialize packages in emac-config!
; (package-initialize)

;; enable emacs-config
(add-to-list 'load-path "~/.emacs.d/emacs-config/")
(require 'emacs-config)
```
