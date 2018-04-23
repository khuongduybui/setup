#!/bin/bash

mkdir -p ~/opt
cd ~/opt
wget https://github.com/zyedidia/micro/releases/download/v1.4.0/micro-1.4.0-linux64.tar.gz
tar -zxf micro-*.tar.gz
ln -s ~/opt/micro-*/micro ~/bin
rm ~/opt/*.tar.gz
cd -
