#! /bin/bash

cd /tmp
curl -s https://api.github.com/repos/imsnif/bandwhich/releases/latest | jq -r ".assets[] | select(.name | test(\"linux-musl.tar.gz\")) | .browser_download_url" | xargs wget -q -O ./bandwhich.tar.gz
tar -zxf bandwhich.tar.gz
sudo rm -f /usr/bin/bandwhich
sudo mv /tmp/bandwhich /usr/bin/
rm -rf bandwhich.tar.gz
cd -
