#! /bin/sh

echo "Install package manager"
# @TODO install AUR

echo "Install system utils"
# @TODO install fish, vim, neovim, byobu, grc, mc, screenfetch

echo "Install dev tools"
# @TODO install nodejs, yarn, python, pip, ruby, gem

echo "Update system"
sudo pacman -Syu --noconfirm

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
