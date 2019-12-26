#! /bin/bash

echo "--- Install package manager ---"
sudo swupd bundle-add os-core-search wget

echo "--- Install system utils ---"
sudo swupd bundle-add shells

sudo swupd bundle-add neovim

sudo swupd bundle-add rsync jq # TODO: byobu direnv, don't need bim grc
# Probably don't need mc and screenfetch either

echo "--- Install dev tools ---"
sudo swupd bundle-add package-builder network-basic
# TODO: nodejs
# TODO: nodejs
# TODO: nodejs
# TODO: nodejs
sudo swupd bundle-add cloud-api
# TODO: aws-ssm
bash ~/setup/linux-inotify.sh
bash ~/setup/linux-micro.sh

echo "--- Update system ---"
sudo swupd update
which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)

# TODO: https://snapcraft.io/docs/installing-snapd
