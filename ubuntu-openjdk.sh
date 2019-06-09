#! /bin/bash

if ! [ -e /etc/apt/sources.list.d/openjdk.list ]; then
    sudo apt install -y dirmngr
    sudo add-apt-repository -y ppa:openjdk-r/ppa
    sudo apt install -y default-jdk-headless
fi
