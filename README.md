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
easy_install --user rope jedi flake8 importmagic autopep8 yapf
```

Checkout rtags project, compile and install it (https://github.com/Andersbakken/rtags).

Install SystemD Units for rdm:

``` bash
mkdir -p ~/.config/systemd/user
cp ~./emacs.d/emacs-config/systemd/user/rdm* ~/.config/systemd/user
systemctl --user daemon-reload
systemctl --user start rdm.socket rdm-restore.service
```

For Javascript install *Node.js*, than with *npm* install **tern** and **js-beautify**.

For Rust install rust environment, then:

```bash
rustup component add rust-src
cargo install racer rustfmt
```

Run Emacs

## Known problems

Sometime you can receive the error `error: Required feature 'pyvenv' was not provided`. If this happen reinstall pyvenv and elpy in this way:

```
M-x package-reinstall pyvenv
M-x package-reinstall elpy
```
