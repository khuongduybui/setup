#! /bin/bash

echo "Install package manager"
# sudo pacman -S --needed base-devel
test -d /tmp/yay || git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
git pull
which yay >/dev/null 2>&1 || makepkg -si --noconfirm
cd -

echo "Install system utils"
yay -S --needed --noconfirm rsync openssh xorg-xauth x11-ssh-askpass
yay -S --needed --noconfirm fish neovim xsel xclip grc mc screenfetch scrot
yay -S --needed --noconfirm byobu
# @TODO: wslu (https://github.com/wslutilities/wslu/issues/33)

echo "Install dev tools"
bash ~/setup/arch-nodejs.sh
# bash ~/setup/arch-openjdk.sh
# bash ~/setup/arch-python.sh
# bash ~/setup/arch-ruby.sh
# ~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade awscli
# bash ~/setup/debian-aws-ssm.sh

echo "Update system"
sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

which fish >/dev/null 2>&1 && sudo chsh -s $(which fish) $(whoami)
