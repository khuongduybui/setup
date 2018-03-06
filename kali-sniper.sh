#! /bin/sh

sudo apt update
sudo apt install -y curl git software-properties-common dirmngr python build-essential
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn
yarn global add forever npm-check-updates electron-forge nodemon aurelia-cli

sudo service dbus start
# sudo apt install -y lubuntu-core

sudo apt install -y mongodb

sudo apt install -y libfontconfig1 aha
sudo apt install -y nmap nikto
# sudo apt install -y metasploit-framework # @TODO
