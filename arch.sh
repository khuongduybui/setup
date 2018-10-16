#! /bin/sh

echo "Install package manager"
# sudo pacman -S --noconfirm --needed base-devel
test -d /tmp/yay || git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
which yay >/dev/null || makepkg -si
cd -

echo "Install system utils"
sudo pacman -Sy --noconfirm rsync openssh xorg-xauth x11-ssh-askpass
sudo pacman -Sy --noconfirm fish neovim xsel xclip grc mc screenfetch scrot
sudo yay -Sy --noconfirm byobu

echo "Install dev tools"
sudo pacman -Sy --noconfirm nodejs yarn
sudo pacman -Sy --noconfirm python2 python2-setuptools python2-pip
sudo pacman -Sy --noconfirm python python-setuptools python-pip
sudo pacman -Sy --noconfirm ruby

echo "Update system"
sudo pacman -Syu --noconfirm
which yay >/dev/null 2>&1 && yay -Syu --noconfirm

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
