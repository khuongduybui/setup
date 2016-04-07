#! /bin/sh
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-add-repository -y ppa:eugenesan/ppa
sudo apt-add-repository -y ppa:neovim-ppa/unstable
wget -O - https://deb.nodesource.com/setup_5.x | sudo bash - > /dev/null

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
  fish \
  neovim unison \
  nodejs \
  python-dev python-pip python3-dev python3-pip
