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
test -e /etc/apt/sources.list.d/yarn.list && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
test -e /etc/apt/sources.list.d/openjdk.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 86F44E2A
test -e /etc/apt/sources.list.d/kali.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv ED444FF07D8D0BF6
test -e /etc/apt/sources.list.d/amazon.list && wget --no-check-certificate -qO - https://cascadia.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
