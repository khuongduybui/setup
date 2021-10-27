#! /usr/bin/env sh

if which brew; then
  brew install starship
else
  cd $(mktemp -d)
  wget -q https://starship.rs/install.sh -O ./starship.sh
  sed -e 's/sudo -v/sudo rm $(mktemp)/g' -i ./starship.sh
  bash ./starship.sh -y
fi
