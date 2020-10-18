#! /bin/bash

# From https://github.com/docker/docker-credential-helpers/releases
cd /tmp
rm -rf docker-credential-pass*
curl -s https://api.github.com/repos/docker/docker-credential-helpers/releases/latest | jq -r ".assets[] | select(.name | test(\"docker-credential-pass\")) | .browser_download_url" | xargs -q -O ./docker-credential-pass.tar.gz
tar -xzf docker-credential-pass.tar.gz
mv docker-credential-pass ~/bin
chmod +x ~/bin/docker-credential-pass
