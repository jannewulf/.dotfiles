#!/usr/bin/env bash

set -e

# remove crontab
crontab -u $(whoami) -l | grep -v '/rd-wallpaper/download-rd-wallpaper.sh'  | crontab -u $(whoami) -

# set old background image
PREV_BG=$(cat "$HOME"/.rd-wallpaper/prev_bg.backup) &&\
gsettings set org.gnome.desktop.background picture-uri "$PREV_BG"

rm -rf "$HOME"/.rd-wallpaper