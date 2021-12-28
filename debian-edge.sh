#! /bin/bash

# wget "https://go.microsoft.com/fwlink/?linkid=2124602" -O /tmp/edge.deb # insiders
wget "https://go.microsoft.com/fwlink/?linkid=2149051" -O /tmp/edge.deb
sudo gdebi /tmp/edge.deb
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF # necessary as of Dec 2021
