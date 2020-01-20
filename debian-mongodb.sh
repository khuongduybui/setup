#! /bin/bash

# From https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/#install-mongodb-community-edition
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu $(lsb_release -cs | sed 's/juno/bionic/' | sed 's/bullseye/bionic/')/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt update -y

sudo apt install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl start mongod
