#! /bin/bash

bash ~/setup/backup-and-copy.sh ~/setup/wsl.conf /etc/

which update-alternatives && sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser $(which explorer.exe) 1
which update-alternatives && sudo update-alternatives --install /usr/bin/www-browser www-browser $(which explorer.exe) 1
