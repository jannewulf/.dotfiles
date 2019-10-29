#!/usr/bin/env bash

rml() {
  tput cuu1 && tput el
}

YES-no() {
  while true; do
    read -p "$1 [Y|n] " -n 1 -r
    echo
    case "$REPLY" in 
      [Y,y] ) return 0;;
      ""    ) return 0;;
      [N,n] ) return 1;;
    esac
  done
}

validate-dotfiles-env-var() {
  if [ -z "$DOTFILES" ]; then 
    if YES-no "Is your .dotfiles directory '$HOME/.dotfiles'?"; then
      DOTFILES="$HOME"/.dotfiles
    else
      # todo: does not work with variables in the path right now
      read -e -p "Please enter the path to your '.dotfiles' directory: " DOTFILES &&\
      DOTFILES=${DOTFILES%/} 
    fi 
    sed -i "s:export DOTFILES=.*:export DOTFILES=$DOTFILES:g" "$DOTFILES"/shell/profile.symlink
  else 
    return 0; 
  fi
}
