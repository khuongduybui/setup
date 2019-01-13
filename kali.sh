#! /bin/bash

echo "Install package manager"
sudo apt install -y curl wget gnupg2 psmisc
sudo apt install -y gdebi apt-transport-https

echo "Install system utils"
sudo apt install -y fish

sudo apt install -y neovim

sudo apt install -y vim byobu grc rsync jq
sudo apt install -y mc screenfetch

echo "Install dev tools"
sudo apt install -y build-essential
bash ~/setup/kali-nodejs.sh
bash ~/setup/kali-openjdk.sh
bash ~/setup/kali-python.sh
bash ~/setup/kali-ruby.sh
test -e ~/.local/bin/awscli || ~/.pyenv/shims/pip install --user --no-warn-script-location awscli

echo "Update system"
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
