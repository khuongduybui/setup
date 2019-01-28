#! /bin/bash

backup-and-link() {
    source="$1"
    destination="$2"
    [[ $2 =~ /$ ]] && destination="$2`basename $1`"
    rm -rf "$destination.`date +%Y-%m-%d`.bak"
    test -e "$destination" && mv "$destination" "$destination.`date +%Y-%m-%d`.bak"
    ln -s "$source" "$destination"
}

# Latest GIT
backup-and-link ~/setup/amazon.gitignore ~/.gitignore
backup-and-link ~/setup/amazon.gitconfig ~/.gitconfig
