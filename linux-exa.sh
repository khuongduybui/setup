#! /usr/bin/env sh

rm -f ~/bin/exa
if which brew; then
    brew install exa
else
    cd $(mktemp -d)
    curl -s https://api.github.com/repos/ogham/exa/releases/latest | jq -r '.assets[] | select(.name | test("linux-x86_64-musl")) | .browser_download_url' | xargs wget -q -O ./exa.zip
    unzip exa.zip
    mv bin/exa ~/bin/exa
fi
