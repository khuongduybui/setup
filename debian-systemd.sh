#! /bin/bash

curl -s https://packagecloud.io/install/repositories/arkane-systems/wsl-translinux/script.deb.sh | sudo bash
sudo apt update -y
sudo apt install -y systemd-genie
