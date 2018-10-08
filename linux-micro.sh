#!/bin/bash

cd /tmp
wget https://github.com/zyedidia/micro/releases/download/v1.4.1/micro-1.4.1-linux64.tar.gz
tar -zxf micro-*.tar.gz
rm -f ~/bin/micro
cp /tmp/micro-*/micro ~/bin
rm -rf micro-*
cd -
