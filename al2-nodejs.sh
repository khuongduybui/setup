#! /bin/bash

sudo yum install -y tar zip unzip perl-File-pushd
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer | bash
~/.nodenv/bin/nodenv install 11.6.0
~/.nodenv/bin/nodenv global 11.6.0

# From https://yarnpkg.com/en/docs/install#centos-stable
curl -L https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn
