#! /bin/bash

echo "--- Install package manager ---"
sudo apt install -y gdebi apt-transport-https

echo "--- Install system utils ---"
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt update -y
sudo apt install -y fish

sudo apt-add-repository -y ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install -y neovim

sudo apt install -y vim byobu grc rsync jq
sudo apt install -y mc screenfetch

echo "--- Install dev tools ---"
sudo apt install -y build-essential python python-pip # python2
bash ~/setup/ubuntu-nodejs.sh
bash ~/setup/ubuntu-openjdk.sh
bash ~/setup/ubuntu-python.sh
bash ~/setup/ubuntu-ruby.sh
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade awscli
test -x /usr/bin/pip && sudo /usr/bin/pip install --upgrade pip
test -x /usr/bin/pip2 && sudo /usr/bin/pip2 install --upgrade pip

echo "--- Update system ---"
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
