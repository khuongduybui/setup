#! /bin/bash

curl -L -O "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
chmod +x install.sh
sudo ./install.sh install
sudo /opt/distrod/bin/distrod enable # --start-on-windows-boot