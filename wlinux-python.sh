#! /bin/bash

if ! [ -e ~/.pyenv/bin/pyenv ]; then
    # From https://github.com/pyenv/pyenv/wiki/Common-build-problems
    sudo apt -t testing install -y \
    git-core wget curl build-essential software-properties-common xz-utils \
    libffi-dev libreadline-dev libsqlite3-dev libssl1.0-dev \
    zlib1g-dev libbz2-dev liblzma-dev \
    libncurses5-dev libncursesw5-dev llvm tk-dev python-openssl

    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
    ~/.pyenv/bin/pyenv install 3.7.1
    ~/.pyenv/bin/pyenv global 3.7.1
    ~/.pyenv/shims/pip install --upgrade pip
    ~/.pyenv/bin/pyenv rehash
fi
