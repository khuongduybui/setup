#! /bin/bash

gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
gpg -a --export ED444FF07D8D0BF6 | sudo apt-key add -
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' | sudo tee /etc/apt/sources.list.d/kali.list
echo '#deb-src http://http.kali.org/kali kali-rolling main non-free contrib' | sudo tee -a /etc/apt/sources.list.d/kali.list
echo 'Package: *' | sudo tee /etc/apt/preferences.d/kali.pref
echo 'Pin: release a=kali-rolling' | sudo tee -a /etc/apt/preferences.d/kali.pref
echo 'Pin-Priority: 1' | sudo tee -a /etc/apt/preferences.d/kali.pref
sudo apt update -y
