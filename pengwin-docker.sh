#! /bin/bash

sudo apt install -y docker.io
brew install docker-compose
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo service docker start
sudo usermod -aG docker "$(whoami)"
