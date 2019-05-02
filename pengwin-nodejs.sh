#! /bin/bash

if ! [ -e ~/.nodenv/bin/nodenv ]; then
    curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer | bash
    ~/.nodenv/bin/nodenv install 11.1.0
    ~/.nodenv/bin/nodenv global 11.1.0
fi

# if ! [ -e /etc/apt/sources.list.d/nodesource.list ]; then
#     curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
#     curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#     sudo apt update -y
#     sudo apt install nodejs -y
# fi

if ! [ -e /etc/apt/sources.list.d/yarn.list ]; then
    # From https://yarnpkg.com/en/docs/install#debian-stable
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update -y
    sudo apt install --no-install-recommends -y yarn
fi
