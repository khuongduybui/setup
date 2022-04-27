#! /usr/bin/env sh

rm -rf ~/bin/nu ~/opt/nushell
if which brew; then
    brew install nushell
else
    cd $(mktemp -d)
    curl -s https://api.github.com/repos/nushell/nushell/releases/latest | grep browser_download_url | grep linux | sed -E 's/ +"browser_download_url": "|"$//g' | xargs wget -q -O ./nu.tar.gz
    tar -xzf nu.tar.gz
    cd nu_*_linux
    mv nushell* ~/opt/nushell
    ln -s ~/opt/nushell/nu ~/bin/
fi
