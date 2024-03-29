#! /bin/bash

cd /tmp
rm -rf ./aws
# From https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
ARCH=$(uname -m)
curl "https://awscli.amazonaws.com/awscli-exe-linux-$ARCH.zip" -o "awscliv2.zip"
unzip awscliv2.zip >/dev/null
sudo ./aws/install --update
