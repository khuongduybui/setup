#! /bin/bash

rm -f ~/bin/bandwhich
if which brew; then
    brew install bandwhich
else
    cd /tmp
    curl -s https://api.github.com/repos/imsnif/bandwhich/releases/latest | jq -r '.assets[] | select(.name | test("linux-musl.tar.gz")) | .browser_download_url' | xargs wget -q -O ./bandwhich.tar.gz
    tar -zxf bandwhich.tar.gz
    mv /tmp/bandwhich ~/bin/
    rm -rf bandwhich.tar.gz
    cd -
fi
