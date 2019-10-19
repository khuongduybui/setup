#! /bin/bash

rm -f /tmp/packages-microsoft-prod.deb
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
sudo dpkg -i /tmp/packages-microsoft-prod.deb

curl -s https://packagecloud.io/install/repositories/arkane-systems/wsl-translinux/script.deb.sh > /tmp/genie.sh
os=ubuntu dist=bionic sudo -E bash /tmp/genie.sh

sudo apt update -y
sudo apt install -y systemd-genie
