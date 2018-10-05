#!/bin/sh

sudo apt install -y automake autoconf build-essential pkgconf zlib1g-dev
sudo mkdir -p /opt/X11rdp
sudo chown $USER /opt/X11rdp
cd /opt/X11rdp
wget http://server1.xrdp.org/xrdp/x11rdp_xorg71.tar.gz
tar -xvf x11rdp_xorg71.tar.gz
cd x11rdp_xorg71
sudo sh buildx.sh /opt/X11rdp –with-fontdir=/usr/share/fonts/X11
sudo ln -s /opt/X11rdp/bin/X11rdp /usr/bin/X11rdp
