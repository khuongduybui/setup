#! /bin/sh

echo "Install package manager"
# sudo apt install -y gdebi

echo "Install system utils"
sudo apt install -y byobu grc rsync
sudo apt install -y mc

echo "Install dev tools"
bash ~/setup/wlinux-openjdk.sh
bash ~/setup/wlinux-nodejs.sh
bash ~/setup/wlinux-ruby.sh
bash ~/setup/wlinux-python.sh
~/.pyenv/shims/pip install --user awscli

echo "Update system"
