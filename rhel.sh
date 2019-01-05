#! /bin/bash

cd /etc/yum.repos.d/
sudo wget http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-5/shells:fish:release:2.repo
sudo yum install -y fish
cd -

wget http://dl.fedoraproject.org/pub/archive/epel/5/i386/epel-release-5-4.noarch.rpm
sudo yum install -y epel-release-5-4.noarch.rpm
sudo yum check-update
sudo yum install -y byobu

test -f ~/.zshrc && mv ~/.zshrc ~/.zshrc.`date +%Y-%m-%d`.bak
test -f ~/.zprofile && mv ~/.zprofile ~/.zprofile.`date +%Y-%m-%d`.bak
# echo "_byobu_sourced=1 byobu -S ~/duybui new-session -A -s duybui" > ~/.zprofile
ln -s ~/setup/rhel.zprofile ~/.zprofile
mkdir -p ~/.byobu
echo "set -g default-shell /usr/bin/fish" > ~/.byobu/.tmux.conf
echo "set -g default-command /usr/bin/fish" >> ~/.byobu/.tmux.conf

# yum install -y w3m

sudo ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
