#!/bin/bash

mkdir -p ~/opt
cd ~/opt
rm -rf micro-*
wget https://github.com/zyedidia/micro/releases/download/v1.4.1/micro-1.4.1-linux64.tar.gz
tar -zxf micro-*.tar.gz
rm -f ~/bin/micro
ln -s ~/opt/micro-*/micro ~/bin
rm -f *.tar.gz
cd -
