#!/bin/bash

sudo add-apt-repository -y ppa:elementary-os/stable
sudo apt update -y
sudo apt install -y elementary-desktop
sudo apt upgrade -y
# sudo add-apt-repository -y ppa:elementary-os/os-patches
# sudo apt update -y
# sudo apt install -y elementary-os-overlay
# sudo apt upgrade -y

sudo mkdir -p /etc/io.elementary.appcenter
sudo touch /etc/io.elementary.appcenter/appcenter.blacklist

gconftool --set --type=string /orgs/pantheon/-terminal/settings/encoding UTF-8

mkdir -p ~/.config
ln -s ~/setup/gtk-3.0 ~/.config
