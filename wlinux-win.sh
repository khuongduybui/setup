#! /bin/sh

test -f /etc/wsl.conf.bak && sudo rm /etc/wsl.conf.bak
test -f /etc/wsl.conf && sudo mv /etc/wsl.conf /etc/wsl.conf.bak
sudo cp ~/setup/wsl.conf /etc

sudo update-alternatives --set x-www-browser /usr/bin/wslview
