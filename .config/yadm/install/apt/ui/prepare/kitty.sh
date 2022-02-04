#!/bin/bash

# https://sw.kovidgoyal.net/kitty/binary/

curl -sSL https://sw.kovidgoyal.net/kitty/installer.sh | sudo sh /dev/stdin launch=n dest=/opt

sudo ln -sf /opt/kitty.app/bin/kitty /usr/local/bin/
sudo mkdir -p /usr/local/share/applications
sudo cp /opt/kitty.app/share/applications/kitty.desktop /usr/local/share/applications/
sudo sed -i "s|Icon=kitty|Icon=/opt/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" /usr/local/share/applications/kitty.desktop

# Introduce kitty to update-alternatives with a priority that should be
# higher than the default
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/kitty 50

# Remove the 'Open in Terminal' nautilus extension. Because it is limited to the GNOME terminal
# See: ~/.local/share/nautilus-python/extensions/open-kitty.py
if dpkg -l | cut -d ' ' -f 3 | grep -E "^nautilus-extension-gnome-terminal$"; then
  sudo apt -y remove nautilus-extension-gnome-terminal
fi

