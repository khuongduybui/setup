#! /bin/bash

# From https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb"
sudo gdebi -n /tmp/session-manager-plugin.deb
