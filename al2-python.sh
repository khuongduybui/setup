#! /bin/bash

if ! [ -e ~/.pyenv/bin/pyenv ]; then
    # From https://github.com/pyenv/pyenv/wiki/Common-build-problems
    sudo yum install -y \
    zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel \
    openssl-devel xz xz-devel libffi-devel

    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
    ~/.pyenv/bin/pyenv install 3.7.2
    ~/.pyenv/bin/pyenv global 3.7.2
fi

~/.pyenv/shims/pip install --upgrade pip
~/.pyenv/bin/pyenv rehash
