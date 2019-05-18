#! /bin/bash

# From https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "/tmp/session-manager-plugin.rpm"
sudo yum install -y /tmp/session-manager-plugin.rpm
