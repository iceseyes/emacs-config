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

or just copy `config.emacs` into `~/.emacs`.

For python install this packages 

``` bash
pip install rope jedi flake8 importmagic
```

## Known problems

Sometime you can receive the error `error: Required feature 'pyvenv' was not provided`. If this happen reinstall pyvenv and elpy in this way:

```
M-x package-reinstall pyvenv
M-x package-reinstall elpy
```
