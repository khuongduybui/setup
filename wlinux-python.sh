#! /bin/bash

sudo apt -t testing install -y \
git-core wget curl build-essential software-properties-common xz-utils \
libbz2-dev libffi-dev liblzma-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl1.0-dev llvm tk-dev zlib1g-dev
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
~/.pyenv/bin/pyenv install 3.7.1
~/.pyenv/bin/pyenv global 3.7.1
~/.pyenv/shims/pip install --upgrade pip
~/.pyenv/bin/pyenv rehash
