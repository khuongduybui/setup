#! /bin/bash

echo "--- Install package manager ---"
sudo apt install -y gdebi apt-transport-https

echo "--- Install system utils ---"
sudo apt install -y fish

sudo apt install -y neovim

sudo apt install -y vim byobu grc rsync jq
sudo apt install -y mc screenfetch

echo "--- Install dev tools ---"
sudo apt install -y build-essential python python-pip # python2
bash ~/setup/wlinux-nodejs.sh
bash ~/setup/wlinux-openjdk.sh
bash ~/setup/wlinux-python.sh
bash ~/setup/wlinux-ruby.sh
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade awscli
sudo /usr/bin/pip* install --upgrade pip

echo "--- Update system ---"
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
