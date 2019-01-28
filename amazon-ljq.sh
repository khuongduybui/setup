#!/bin/bash

if [ -e ~/opt/LiveJQ ]; then
    cd ~/opt/LiveJQ
    git pull
else
    mkdir -p ~/opt
    git clone ssh://git.amazon.com/pkg/LiveJQ ~/opt/LiveJQ
fi
rm -rf ~/bin/ljq
mkdir -p ~/bin
chmod +x ~/opt/LiveJQ/ljq
ln ~/opt/LiveJQ/ljq ~/bin/
