#! /bin/bash

if ! [ -e ~/.rbenv/bin/rbenv ]; then
    sudo yum install -y openssl-devel readline-devel zlib-devel
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
    ~/.rbenv/bin/rbenv install 2.5.3
    ~/.rbenv/bin/rbenv global 2.5.3
fi
