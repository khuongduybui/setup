#!/bin/bash

unison_ver=2.48.4
sudo apt install ocaml
wget http://www.seas.upenn.edu/~bcpierce/unison//download/releases/unison-${unison_ver}/unison-${unison_ver}.tar.gz
tar xvf unison-${unison_ver}.tar.gz
cd src
make UISTYLE=text || true
sudo cp unison           /usr/bin
sudo cp unison-fsmonitor /usr/bin
