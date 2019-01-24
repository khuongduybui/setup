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

if ! [ -e /etc/apt/sources.list.d/wslu.list ]; then
    sudo apt install -y apt-transport-https
    wget -O - https://api.patrickwu.space/public.key | sudo apt-key add -
    echo "deb https://apt.patrickwu.space/ stable main" | sudo tee /etc/apt/sources.list.d/wslu.list
    sudo apt update -y
    sudo apt install -y wslu
    sudo wslview -r 2>/dev/null || (sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/wslview 1 && sudo update-alternatives --install /usr/bin/www-browser www-browser /usr/bin/wslview 1)
fi
