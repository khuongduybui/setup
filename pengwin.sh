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
bash ~/setup/pengwin-nodejs.sh
bash ~/setup/pengwin-openjdk.sh
bash ~/setup/pengwin-python.sh
bash ~/setup/pengwin-ruby.sh
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade awscli
test -x /usr/bin/pip && sudo /usr/bin/pip install --upgrade pip
test -x /usr/bin/pip2 && sudo /usr/bin/pip2 install --upgrade pip

echo "--- Update system ---"
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
