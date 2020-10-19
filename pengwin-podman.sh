#! /bin/bash

sudo apt install -y podman runc
UID=cat /etc/passwd | grep $USER | cut -d ':' -f 3
mkdir -p /run/user/$UID/libpod
