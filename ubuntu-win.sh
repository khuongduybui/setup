#! /bin/sh

test -f /etc/wsl.conf.bak && sudo rm /etc/wsl.conf.bak
test -f /etc/wsl.conf && sudo mv /etc/wsl.conf /etc/wsl.conf.bak
sudo ln -s ~/setup/wsl.conf /etc
