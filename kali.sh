#! /bin/bash

echo "Install package manager"
sudo apt install -y wget gnupg2 rsync psmisc
# sudo apt install -y gdebi

echo "Install system utils"
sudo apt install -y fish vim neovim byobu
sudo apt install -y mc screenfetch

echo "Install dev tools"
wget -O - https://deb.nodesource.com/setup_9.x | sudo -E bash - > /dev/null
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update -y
sudo apt install -y \
build-essential dkms debhelper awscli \
nodejs yarn \
python-dev python-pip python3-dev python3-pip \

echo "Update system"
sudo apt upgrade -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
