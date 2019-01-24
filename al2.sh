#! /bin/bash

echo "--- Install package manager ---"
# sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y deltarpm
sudo amazon-linux-extras install -y epel mate-desktop1.x

echo "--- Install system utils ---"
curl -L https://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo | sudo tee /etc/yum.repos.d/fish.repo
sudo yum install -y fish

sudo yum install -y neovim

sudo amazon-linux-extras install -y vim
sudo yum install -y byobu rsync jq # @TODO: grc
sudo yum install -y mc # @TODO: screenfetch

echo "---Install dev tools---"
sudo yum groupinstall -y "Development Tools"
bash ~/setup/al2-nodejs.sh
bash ~/setup/al2-openjdk.sh
bash ~/setup/al2-python.sh
bash ~/setup/al2-ruby.sh
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade awscli
sudo /usr/bin/pip install --upgrade pip

echo "Update system"
sudo yum update -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
