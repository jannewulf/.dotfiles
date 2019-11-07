#!/usr/bin/env bash

# link settings file
ln-backup "$DOTFILES"/vscode/settings.json.symlink "$HOME"/.config/Code/User/settings.json

# install vscode extensions
code --install-extension ms-python.python
code --install-extension timonwong.shellcheck