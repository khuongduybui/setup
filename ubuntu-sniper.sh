#! /bin/sh

sudo apt update
sudo apt install -y curl git software-properties-common dirmngr python build-essential
yarn global add forever npm-check-updates electron-forge nodemon aurelia-cli @feathersjs/cli

sudo service dbus start
# sudo apt install -y lubuntu-core

bash ~/setup/ubuntu-mongodb.sh

sudo apt install -y libfontconfig1 aha
# sudo apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
# echo deb http://http.kali.org/kali kali-rolling main contrib non-free | sudo tee /etc/apt/sources.list.d/katoolin.list.disabled
# sudo mv /etc/apt/sources.list.d/katoolin.list.disabled /etc/apt/sources.list.d/katoolin.list
# sudo apt update
# sudo apt install -y nmap nikto
# sudo apt install -y metasploit-framework # @TODO
# sudo mv /etc/apt/sources.list.d/katoolin.list /etc/apt/sources.list.d/katoolin.list.disabled
# sudo apt update

# ln -s ~/setup/kapt ~/bin
