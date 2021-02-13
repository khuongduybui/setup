#! /bin/bash

wget -qO - https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \
  | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/linux-surface.gpg
echo "deb [arch=amd64] https://pkg.surfacelinux.com/debian release main" \
  | sudo tee /etc/apt/sources.list.d/linux-surface.list

sudo apt install -y linux-image-surface linux-headers-surface iptsd libwacom-surface
sudo systemctl enable iptsd

sudo apt install -y linux-image-surface linux-headers-surface iptsd libwacom-surface linux-surface-secureboot-mok
sudo update-grub

# sudo apt install -y git curl wget sed
# test -e ~/linux-surface || git clone --depth 1 https://github.com/jakeday/linux-surface.git ~/linux-surface
# cd ~/linux-surface
# git pull
# sudo bash setup.sh

uname -a

echo https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup#post-installation
