#! /bin/bash

# From https://github.com/wagoodman/dive/releases
cd /tmp
rm -rf dive.deb
curl -s https://api.github.com/repos/wagoodman/dive/releases/latest | jq -r '.assets[] | select(.name | test("linux_amd64.deb")) | .browser_download_url' | xargs wget -q -O ./dive.deb
sudo apt install ./dive.deb
