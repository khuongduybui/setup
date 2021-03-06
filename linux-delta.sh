#! /usr/bin/env sh

cd $(mktemp -d)
curl -s https://api.github.com/repos/dandavison/delta/releases/latest | jq -r ".assets[] | select(.name | test(\"x86_64-unknown-linux-musl.tar.gz\")) | .browser_download_url" | xargs wget -q -O ./delta.tar.gz
tar -xzf ./delta.tar.gz
rm -rf ~/bin/delta
mv delta-*-x86_64-unknown-linux-musl/delta ~/bin/delta
