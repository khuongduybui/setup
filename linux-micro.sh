#! /bin/bash

cd /tmp
curl -s https://api.github.com/repos/zyedidia/micro/releases/latest | jq -r ".assets[] | select(.name | test(\"linux64.tar.gz\")) | .browser_download_url" | xargs wget -q -O ./micro.tar.gz
tar -zxf micro.tar.gz
rm -f ~/bin/micro
cp /tmp/micro-*/micro ~/bin
rm -rf micro-*
cd -
