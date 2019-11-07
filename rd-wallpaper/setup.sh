#!/usr/bin/env bash

BG_DIR="$HOME"/.rd-wallpaper

create_background_dir() {
  if [ ! -d "$BG_DIR" ]; then
    mkdir "$BG_DIR"
  fi
}

backup_current_bg_setting() {
  gsettings get org.gnome.desktop.background picture-uri > "$BG_DIR"/prev_bg.backup
}

create_background_dir
backup_current_bg_setting

# run it once to download and set the first wallpaper
source "$DOTFILES"/rd-wallpaper/download-rd-wallpaper.sh $>/dev/null
gsettings set org.gnome.desktop.background picture-uri file://"$HOME"/.rd-wallpaper/bg.jpg

# create cron job to change wallpaper every 15 minutes
(crontab -u $(whoami) -l 2>/dev/null; echo "*/15 * * * * "$DOTFILES"/rd-wallpaper/download-rd-wallpaper.sh") | crontab -u $(whoami) -
