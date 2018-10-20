#! /bin/sh

echo "Install package manager"
sudo pacman -S --needed base-devel
test -d /tmp/yay || git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
which yay >/dev/null 2>&1 || makepkg -si --noconfirm
cd -

echo "Install system utils"
yay -S --needed --noconfirm rsync openssh xorg-xauth x11-ssh-askpass
yay -S --needed --noconfirm fish neovim xsel xclip grc mc screenfetch scrot
yay -S --needed --noconfirm byobu
# @TODO: wslu (https://github.com/wslutilities/wslu/issues/33)

echo "Install dev tools"
yay -S --needed --noconfirm nodejs-n
which node >/dev/null 2>&1 || sudo n latest
yay -S --needed --noconfirm --assume-installed nodejs yarn 
yay -S --needed --noconfirm python2 python2-setuptools python2-pip
yay -S --needed --noconfirm python python-setuptools python-pip
yay -S --needed --noconfirm rbenv ruby-build
rbenv versions | grep -q 2.5.1 || rbenv install 2.5.1
rbenv global 2.5.1
eval "$(rbenv init -)"
gem install bundler
rbenv rehash

echo "Update system"
sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

which fish >/dev/null 2>&1 && sudo chsh -s $(which fish) $(whoami)
