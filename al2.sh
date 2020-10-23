#! /bin/bash

echo "--- Install package manager ---"
# sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y deltarpm
sudo amazon-linux-extras install -y epel util-linux-user
curl -L https://download.opensuse.org/repositories/utilities/RHEL_7/utilities.repo | sudo tee /etc/yum.repos.d/opensuse-utilities.repo

echo "--- Install system utils ---"
if [ ! -e /etc/yum.repos.d/fish.repo ]; then
    curl -L https://download.opensuse.org/repositories/shells:fish:release:3/RHEL_7/shells:fish:release:3.repo | sudo tee /etc/yum.repos.d/fish.repo
    sudo yum install -y fish
fi

sudo yum install -y neovim

sudo amazon-linux-extras install -y vim
sudo yum install -y byobu rsync jq grc
sudo yum install -y mc # @TODO: screenfetch

echo "---Install dev tools---"
sudo yum groupinstall -y "Development Tools"
sudo yum install -y openssl-devel
# sudo yum install -y python2 python2-pip
# bash ~/setup/al2-nodejs.sh
# bash ~/setup/al2-openjdk.sh
# bash ~/setup/al2-python.sh
# bash ~/setup/al2-ruby.sh
# ~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade awscli
# test -x /usr/bin/pip && sudo /usr/bin/pip install --upgrade pip
# test -x /usr/bin/pip2 && sudo /usr/bin/pip2 install --upgrade pip
bash ~/setup/al2-aws-ssm.sh

echo "---Update system---"
sudo yum update -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
