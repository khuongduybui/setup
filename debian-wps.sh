#! /bin/bash

# # From http://wps-community.org/downloads
# wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9505/wps-office_11.1.0.9505.XA_amd64.deb -O /tmp/wps.deb
# sudo apt install -y xdg-utils
# sudo apt install -y /tmp/wps.deb

echo sudo snap install wps-2019-snap
echo sudo snap connect wps-2019-snap:cups-control :cups-control
echo sudo snap connect wps-2019-snap:alsa :alsa
echo sudo snap connect wps-2019-snap:pulseaudio :pulseaudio
echo sudo snap connect wps-2019-snap:removable-media :removable-media
