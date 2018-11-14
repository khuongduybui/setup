#! /bin/sh

sudo apt -t testing install -y \
git-core wget curl build-essential software-properties-common xz-utils \
libffi-dev libreadline-dev libsqlite3-dev libssl1.0-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
~/.rbenv/bin/rbenv install 2.5.3
~/.rbenv/bin/rbenv global 2.5.3
