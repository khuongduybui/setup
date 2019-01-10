#! /bin/bash

test -f /etc/wsl.conf && sudo mv /etc/wsl.conf /etc/wsl.conf.`date +%Y-%m-%d`.bak
sudo cp ~/setup/wsl.conf /etc

sudo wslview -r || (sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/wslview 1 && sudo update-alternatives --install /usr/bin/www-browser www-browser /usr/bin/wslview 1)

# From https://github.com/WhitewaterFoundry/WLinux/issues/285#issuecomment-453153832
wget http://ftp.us.debian.org/debian/pool/main/s/systemd/libudev1_239-12~bpo9+1_amd64.deb -O /tmp/udev.deb
wget http://ftp.us.debian.org/debian/pool/main/s/systemd/udev_239-12~bpo9+1_amd64.deb -O /tmp/libudev1.deb
sudo apt install -y --allow-downgrades /tmp/udev.deb /tmp/libudev1.deb
