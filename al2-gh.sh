#! /bin/bash

# From https://github.com/cli/cli/releases
rm -rf /tmp/gh-cli.rpm
curl -s https://api.github.com/repos/cli/cli/releases/latest | jq -r '.assets[] | select(.name | test("linux_amd64.rpm")) | .browser_download_url' | xargs -q -O /tmp/gh-cli.rpm
sudo yum install /tmp/gh-cli.rpm
rm -rf /tmp/gh-cli.rpm
