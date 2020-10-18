#! /bin/bash

# curl -s https://api.github.com/repos/adam7/delugia-code/releases/latest | jq -r ".assets[] | select(.name | test(\"omplete.ttf\")) | .browser_download_url" | xargs wget -q -O ~/setup/Delugia.Nerd.Font.Complete.ttf
cd /tmp
wget -q -O ./docker-credential-pass.tar.gz https://github.com/docker/docker-credential-helpers/releases/download/v0.6.3/docker-credential-pass-v0.6.3-amd64.tar.gz
tar -xzf docker-credential-pass.tar.gz
mv docker-credential-pass ~/bin
chmod +x ~/bin/*
