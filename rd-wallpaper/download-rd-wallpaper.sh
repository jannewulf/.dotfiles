#!/usr/bin/env bash

# DOTFILES variable not available in cron. so read it from .profile
DOTFILES="$(grep "export DOTFILES" "$HOME"/.profile | cut -d '=' -f 2)"
URL=$(shuf -n 1 "$DOTFILES"/rd-wallpaper/imgs.txt) || return 1

BG_DIR="$HOME"/.rd-wallpaper

if [ ! -d "$BG_DIR" ]; then
  mkdir "$BG_DIR"
fi

# temporary saving is required because file would be overwritten 
# with empty file if download fails
wget -q -O "$BG_DIR"/bg-tmp.jpg "$URL" &&\
mv "$BG_DIR"/bg-tmp.jpg "$BG_DIR"/bg.jpg

echo Downloaded "$URL"
