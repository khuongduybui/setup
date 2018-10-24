#! /bin/bash

cd (mktemp --directory)    
curl -O https://download.sublimetext.com/sublimehq-pub.gpg
sudo pacman-key --add sublimehq-pub.gpg
sudo pacman-key --lsign-key 8A8F901A
grep -q download.sublimetext.com /etc/pacman.conf || echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu --needed sublime-text sublime-merge
