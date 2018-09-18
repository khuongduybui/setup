#! /bin/sh

sudo apt update
sudo apt install -y curl git software-properties-common dirmngr python build-essential
yarn global add forever npm-check-updates electron-forge nodemon aurelia-cli @feathersjs/cli

sudo service dbus start
# sudo apt install -y lubuntu-core

bash ~/setup/kali-mongodb.sh

sudo apt install -y libfontconfig1 aha
sudo apt install -y nmap nikto
# sudo apt install -y metasploit-framework # @TODO: antivirus exclusion
