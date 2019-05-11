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
