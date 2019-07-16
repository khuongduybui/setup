#! /bin/bash

if ! [ -e ~/.pyenv/bin/pyenv ]; then
    # From https://github.com/pyenv/pyenv/wiki/Common-build-problems
    sudo apt install -y \
        git wget curl build-essential software-properties-common xz-utils \
        libffi-dev libreadline-dev libsqlite3-dev libssl-dev \
        zlib1g-dev libbz2-dev liblzma-dev \
        libncurses5-dev libncursesw5-dev llvm tk-dev python-openssl
fi

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
VERSION=3.7.4
~/.pyenv/bin/pyenv versions | grep -q $VERSION || ~/.pyenv/bin/pyenv install $VERSION
~/.pyenv/bin/pyenv global $VERSION

~/.pyenv/shims/pip install --upgrade pip
~/.pyenv/bin/pyenv rehash
