#! /bin/bash

if ! [ -e /etc/apt/sources.list.d/whitewaterfoundry_wslu.list ]; then
    if ! [ -e /etc/apt/sources.list.d/whitewaterfoundry.list ]; then
        curl -s https://packagecloud.io/install/repositories/whitewaterfoundry/wslu/script.deb.sh | sudo bash
        sudo apt install -y wslu
    fi
fi
