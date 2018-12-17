#! /bin/bash

# From http://wps-community.org/downloads
wget http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb -O /tmp/wps.deb
sudo apt install -y xdg-utils
sudo apt install -y /tmp/wps.deb
