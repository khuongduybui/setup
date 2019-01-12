#! /bin/bash

test -f /etc/wsl.conf && sudo mv /etc/wsl.conf /etc/wsl.conf.`date +%Y-%m-%d`.bak
sudo cp ~/setup/wsl.conf /etc

sudo wslview -r || (sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/wslview 1 && sudo update-alternatives --install /usr/bin/www-browser www-browser /usr/bin/wslview 1)
