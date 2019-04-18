#! /bin/bash

if ! [ -e /etc/apt/sources.list.d/kali.list ]; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv ED444FF07D8D0BF6
    echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' | sudo tee /etc/apt/sources.list.d/kali.list
    echo '#deb-src http://http.kali.org/kali kali-rolling main non-free contrib' | sudo tee -a /etc/apt/sources.list.d/kali.list
    echo 'Package: *' | sudo tee /etc/apt/preferences.d/kali.pref
    echo 'Pin: release a=kali-rolling' | sudo tee -a /etc/apt/preferences.d/kali.pref
    echo 'Pin-Priority: 1' | sudo tee -a /etc/apt/preferences.d/kali.pref
    sudo apt update -y
fi
