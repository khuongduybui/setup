#! /bin/bash

# From https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/#install-mongodb-community-edition
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt update -y
sudo apt install -y mongodb-org

grep -q -i "Microsoft" /proc/version && sudo cp ~/setup/mongodb.init.d /etc/init.d/mongodb # systemd not supported in WSL
