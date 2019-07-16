#! /bin/bash

if ! [ -e /etc/apt/sources.list.d/yarn.list ]; then
    # From https://yarnpkg.com/en/docs/install#debian-stable
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update -y
    sudo apt install --no-install-recommends -y yarn
fi

curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer | bash
VERSION=11.15.0
~/.nodenv/bin/nodenv versions | grep -q $VERSION || ~/.nodenv/bin/nodenv install $VERSION
~/.nodenv/bin/nodenv global $VERSION
