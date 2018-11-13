#! /bin/sh

echo "Install package manager"
# sudo apt install -y gdebi

echo "Install system utils"
sudo apt install -y byobu grc rsync
sudo apt install -y mc

echo "Install dev tools"
bash ~/setup/wlinux-nodejs.sh

# sudo apt install -y awscli

echo "Update system"
