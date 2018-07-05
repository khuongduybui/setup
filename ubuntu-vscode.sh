#!/bin/bash

wget --no-check-certificate -qO - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
# sudo add-apt-repository -y ppa:therealkenc/wsl-pulseaudio
sudo apt update -y
# sudo apt install -y --allow-downgrades pulseaudio=1:8.0-0ubuntu3.7ppa1 libpulse0=1:8.0-0ubuntu3.7ppa1 libpulse-mainloop-glib0=1:8.0-0ubuntu3.7ppa1 pulseaudio-utils=1:8.0-0ubuntu3.7ppa1 libpulsedsp=1:8.0-0ubuntu3.7ppa1 pulseaudio-module-x11=1:8.0-0ubuntu3.7ppa1
sudo apt install -y code
# sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1
which gsettings && gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "<Super>"
