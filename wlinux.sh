#! /bin/sh

echo "Install package manager"
# sudo apt install -y gdebi

echo "Install system utils"
sudo apt install -y byobu grc rsync
sudo apt install -y mc

echo "Install dev tools"
sudo apt install -y python-pip python3-pip awscli

echo "Update system"