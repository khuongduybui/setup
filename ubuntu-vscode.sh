#!/bin/bash

wget --no-check-certificate -qO - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
sudo apt install -y code libxss1 libasound2
which gsettings && gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "<Super>"

# for vscode liveshare
# sudo apt install -yq libunwind8 liblttng-ust0 libicu?? libuuid1 libkrb5-3 zlib1g gnome-keyring libsecret-1-0 desktop-file-utils gettext x11-utils libcurl3
