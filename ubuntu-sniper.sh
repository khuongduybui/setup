#! /bin/sh

sudo apt update
sudo apt install -y curl git software-properties-common dirmngr python build-essential
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn
yarn global add forever npm-check-updates electron-forge

sudo service dbus start
# sudo apt install -y lubuntu-core

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt update
test -d /mnt/c/Users/duybui && sudo apt install -y mongodb
sudo apt install -y mongodb-org

sudo apt install -y libfontconfig1 aha
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
echo deb http://http.kali.org/kali kali-rolling main contrib non-free | sudo tee /etc/apt/sources.list.d/katoolin.list.disabled
sudo mv /etc/apt/sources.list.d/katoolin.list.disabled /etc/apt/sources.list.d/katoolin.list
sudo apt update
sudo apt install -y nmap nikto
# sudo apt install -y metasploit-framework # @TODO
sudo mv /etc/apt/sources.list.d/katoolin.list /etc/apt/sources.list.d/katoolin.list.disabled
sudo apt update

ln -s ~/setup/kapt ~/bin

