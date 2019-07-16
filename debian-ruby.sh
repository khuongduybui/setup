#! /bin/bash

if ! [ -e ~/.rbenv/bin/rbenv ]; then
    sudo apt install -y \
        git wget curl build-essential software-properties-common xz-utils \
        libffi-dev libreadline-dev libsqlite3-dev libssl-dev \
        zlib1g-dev libbz2-dev liblzma-dev \
        libxml2-dev libxslt1-dev libyaml-dev
fi

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
VERSION=2.6.3
~/.rbenv/bin/rbenv versions | grep -q $VERSION || ~/.rbenv/bin/rbenv install $VERSION
~/.rbenv/bin/rbenv global $VERSION
