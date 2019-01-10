#! /bin/bash

# From https://code.visualstudio.com/docs/setup/linux
wget --no-check-certificate -qO - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
sudo apt install -y code libxss1 libasound2 libx11-xcb-dev

grep -q /etc/sysctl.conf -e "fs.inotify.max_user_watches" || (echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf && sudo sysctl -p)
