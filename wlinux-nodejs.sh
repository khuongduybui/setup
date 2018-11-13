#!/bin/bash

curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer | bash
~/.nodenv/bin/nodenv install 11.1.0
~/.nodenv/bin/nodenv global 11.1.0

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update -y
sudo apt install --no-install-recommends -y yarn
