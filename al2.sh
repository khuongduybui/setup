#! /bin/bash

echo "Install package manager"
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

echo "Install system utils"
cd /etc/yum.repos.d/
sudo wget https://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo
sudo yum install -y fish neovim byobu
sudo amazon-linux-extras install vim
# @TODO mc screenfetch grc

echo "Install dev tools"
wget -O - https://rpm.nodesource.com/setup_10.x | sudo -E bash - > /dev/null
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y \
gcc-c++ make \
nodejs yarn \

sudo amazon-linux-extras install python3

echo "Update system"
# sudo yum update -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
