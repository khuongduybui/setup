#! /bin/bash

which apt >/dev/null 2>&1 && sudo apt install -y inotify-tools
which yum >/dev/null 2>&1 && sudo yum install -y inotify-tools
if ! grep -q /etc/sysctl.conf -e "fs.inotify.max_user_watches"; then
    echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
fi
sudo sysctl -p
