#! /bin/bash

test -f /etc/wsl.conf && sudo mv /etc/wsl.conf /etc/wsl.conf.`date +%Y-%m-%d`.bak
sudo cp ~/setup/wsl.conf /etc

sudo wslview -r
