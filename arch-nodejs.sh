#! /bin/bash

curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer | bash
~/.nodenv/bin/nodenv versions | grep -q 11.1.0 || ~/.nodenv/bin/nodenv install 11.1.0
~/.nodenv/bin/nodenv global 11.1.0

yay -S --needed --noconfirm --assume-installed nodejs yarn
