#!/usr/bin/env bash

NEWLINK="$HOME"/.profile

if [ -f "$NEWLINK" ]; then
  if [ -r "$NEWLINK" ] && [ -w $(dirname "$NEWLINK") ]; then
    mv "$NEWLINK" "$NEWLINK".backup
  else
    echo "unable to backup $NEWLINK, check permissions. Not linked." >&2
    exit 1
  fi
fi

ln -s "$DOTFILES"/shell/profile.symlink $NEWLINK
exit $?
