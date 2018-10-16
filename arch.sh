#! /bin/sh

echo "Install package manager"
# @TODO install AUR
# sudo pacman -S --noconfirm --needed base-devel
# test -d /tmp/yay || git clone https://aur.archlinux.org/yay.git /tmp/yay
# cd /tmp/yay
# which yay >/dev/null || makepkg -si
# cd -
# fakeroot is not working correctly due to Sys IPC not implemented

echo "Install system utils"
sudo pacman -Sy --noconfirm rsync openssh xorg-xauth x11-ssh-askpass
sudo pacman -Sy --noconfirm fish neovim xsel xclip grc mc screenfetch scrot
# @TODO install byobu

echo "Install dev tools"
sudo pacman -Sy --noconfirm nodejs yarn
sudo pacman -Sy --noconfirm python2 python2-setuptools python2-pip
sudo pacman -Sy --noconfirm python python-setuptools python-pip
sudo pacman -Sy --noconfirm ruby

echo "Update system"
sudo pacman -Syu --noconfirm

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
