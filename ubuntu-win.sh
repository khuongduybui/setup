#! /bin/bash

test -f /etc/wsl.conf.bak && sudo rm /etc/wsl.conf.bak
test -f /etc/wsl.conf && sudo mv /etc/wsl.conf /etc/wsl.conf.bak
sudo cp ~/setup/wsl.conf /etc

sudo apt install -y apt-transport-https
wget -O - https://api.patrickwu.space/public.key | sudo apt-key add -
echo "deb https://apt.patrickwu.space/ stable main" | sudo tee /etc/apt/sources.list.d/wslu.list
sudo apt update -y
sudo apt install -y wslu
sudo wslview -r
# sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/wslview 1
# sudo update-alternatives --install /usr/bin/www-browser www-browser /usr/bin/wslview 1
