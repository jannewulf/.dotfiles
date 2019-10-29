#!/usr/bin/env bash
#
# Provide functions for log texts

source "$DOTFILES"/script/helper/print_colors.sh

print_datetime () {
  print_gray_light "\r[$(date '+%d/%m/%Y %H:%M:%S')]  "
}

info () {
  print_datetime
  print_white "$1\n"
}

error () {
  print_datetime
  print_red "$1\n"
}
