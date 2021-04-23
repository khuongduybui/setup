#! /bin/bash

# rm -f /tmp/packages-microsoft-prod.deb
# wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
# sudo dpkg -i /tmp/packages-microsoft-prod.deb

# curl -s https://packagecloud.io/install/repositories/arkane-systems/wsl-translinux/script.deb.sh > /tmp/genie.sh
# os=ubuntu dist=bionic sudo -E bash /tmp/genie.sh

# sudo apt update -y
# sudo apt install -y systemd-genie

# test -e /usr/sbin/daemonize || sudo ln -s /usr/bin/daemonize /usr/sbin
sudo apt install -y apt-transport-https

sudo wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg

sudo chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg

cat << EOF | sudo tee /etc/apt/sources.list.d/wsl-transdebian.list
deb https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
EOF

sudo apt update -y
sudo apt install -y systemd-genie
