#! /bin/bash

backup-and-link() {
    source="$1"
    destination="$2"
    [[ $2 =~ /$ ]] && destination="$2`basename $1`"
    sudo rm -rf "$destination.`date +%Y-%m-%d`.bak"
    test -e "$destination" && sudo mv "$destination" "$destination.`date +%Y-%m-%d`.bak"
    sudo ln -s "$source" "$destination"
}

backup-and-link ~/setup/wsl.conf /etc/

if ! [ -e /etc/apt/sources.list.d/whitewaterfoundry_wslu.list ]; then
    curl -s https://packagecloud.io/install/repositories/whitewaterfoundry/wslu/script.deb.sh | sudo bash
    sudo apt install -y wslu
fi
