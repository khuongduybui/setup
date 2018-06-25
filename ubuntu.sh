#! /bin/sh

echo "Install package manager"
# sudo apt install -y gdebi

echo "Install system utils"
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-add-repository -y ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install -y fish vim neovim byobu grc
sudo apt install -y mc screenfetch

echo "Install dev tools"
wget -O - https://deb.nodesource.com/setup_9.x | sudo -E bash - > /dev/null
sudo apt update -y
sudo apt install -y \
build-essential dkms debhelper awscli \
nodejs \
python-dev python-pip python3-dev python3-pip \

echo "Update system"
sudo apt upgrade -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
