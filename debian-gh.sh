#! /bin/bash

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
sudo apt install -y dirmngr software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh
