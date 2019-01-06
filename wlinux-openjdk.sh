#! /bin/bash

if ! [ -e /etc/apt/sources.list.d/openjdk.list ]; then
    sudo apt install -y dirmngr
    # From https://launchpad.net/~openjdk-r/+archive/ubuntu/ppa
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 86F44E2A
    echo "deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/openjdk.list
    sudo apt update -y
    sudo apt install -y default-jdk-headless

    # required for openjdk-9
    curl http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_1.3.0-0ubuntu2.1_amd64.deb -o /tmp/libjpeg8-turbo.deb
    curl http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_amd64.deb -o /tmp/libjpeg8.deb
    curl http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8-dev_8c-2ubuntu8_amd64.deb -o /tmp/libjpeg8-dev.deb
    curl http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8-dev_1.3.0-0ubuntu2.1_amd64.deb -o /tmp/libjpeg8-turbo-dev.deb
    sudo apt install -y /tmp/libjpeg8-turbo.deb /tmp/libjpeg8.deb /tmp/libjpeg8-dev.deb /tmp/libjpeg8-turbo-dev.deb
fi
