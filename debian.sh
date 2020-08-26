#! /bin/bash

echo "--- Install package manager ---"
sudo apt install -y gdebi apt-transport-https dirmngr

echo "--- Install system utils ---"
sudo apt install -y fish

sudo apt install -y neovim

sudo apt install -y vim byobu grc rsync jq direnv
sudo apt install -y mc screenfetch

echo "--- Install dev tools ---"
sudo apt install -y build-essential librust-openssl-dev
# bash ~/setup/debian-nodejs.sh
# bash ~/setup/debian-openjdk.sh
# bash ~/setup/debian-python.sh
# bash ~/setup/debian-ruby.sh
# sudo apt install -y awscli
bash ~/setup/debian-aws-ssm.sh

echo "--- Update system ---"
# test -e /etc/apt/sources.list.d/yarn.list && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# test -e /etc/apt/sources.list.d/openjdk.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 86F44E2A
# test -e /etc/apt/sources.list.d/kali.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv ED444FF07D8D0BF6
# test -e /etc/apt/sources.list.d/mongodb-org-4.0.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
test -e /etc/apt/sources.list.d/whitewaterfoundry.list && wget --no-check-certificate -qO - https://packagecloud.io/whitewaterfoundry/wslu/gpgkey | sudo apt-key add -
test -e /etc/apt/sources.list.d/whitewaterfoundry_wslu.list && wget --no-check-certificate -qO - https://packagecloud.io/whitewaterfoundry/wslu/gpgkey | sudo apt-key add -

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
