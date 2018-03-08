#!/bin/bash

wget --no-check-certificate -qO - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
# sudo add-apt-repository -y ppa:therealkenc/wsl-pulseaudio
sudo apt update -y
# sudo apt upgrade -y
sudo apt install -y code
