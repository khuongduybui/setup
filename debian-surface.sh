#! /bin/bash

sudo apt install -y git curl wget sed
test -e ~/linux-surface || git clone --depth 1 https://github.com/jakeday/linux-surface.git ~/linux-surface
cd ~/linux-surface
git pull
sudo bash setup.sh

