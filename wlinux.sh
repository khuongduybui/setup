#! /bin/bash

echo "Install package manager"
echo 'deb https://deb.debian.org/debian stable main contrib non-free' | sudo tee /etc/apt/sources.list.d/stretch.list
echo 'deb https://deb.debian.org/debian stable-updates main' | sudo tee -a /etc/apt/sources.list.d/stretch.list
echo 'deb https://deb.debian.org/debian-security stable/updates main' | sudo tee -a /etc/apt/sources.list.d/stretch.list
echo 'deb https://deb.debian.org/debian stretch-backports main' | sudo tee -a /etc/apt/sources.list.d/stretch.list
sudo apt update -y
sudo apt install -y gdebi apt-transport-https

echo "Install system utils"
sudo apt install -y fish

sudo apt install -y neovim

sudo apt install -y vim byobu grc rsync jq
sudo apt install -y mc screenfetch

echo "Install dev tools"
sudo apt install -y build-essential
bash ~/setup/wlinux-nodejs.sh
bash ~/setup/wlinux-openjdk.sh
bash ~/setup/wlinux-python.sh
bash ~/setup/wlinux-ruby.sh
test -e ~/.local/bin/awscli || ~/.pyenv/shims/pip install --user --no-warn-script-location awscli

echo "Update system"
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
