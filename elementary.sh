#! /bin/bash

sudo apt install -y jq
sudo apt install -y elementary-sdk
sudo apt install -y docker.io
sudo apt install -y direnv
sudo apt install -y pass

sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks
sudo apt install -y pantheon-tweaks

sudo apt install -y gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
