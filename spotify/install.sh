#!/usr/bin/env bash

wget -q https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update &>/dev/null && sudo apt install -y spotify-client &>/dev/null
