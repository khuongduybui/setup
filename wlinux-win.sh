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

sudo wslview -r 2>/dev/null || (sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/wslview 1 && sudo update-alternatives --install /usr/bin/www-browser www-browser /usr/bin/wslview 1)
