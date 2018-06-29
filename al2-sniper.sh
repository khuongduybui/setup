#! /bin/sh

sudo yum install -y curl
# https://yarnpkg.com/lang/en/docs/install/#centos-stable
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn
yarn global add forever npm-check-updates electron-forge nodemon aurelia-cli @feathersjs/cli

# https://docs.mongodb.com/tutorials/install-mongodb-on-amazon/
sudo cp ~/setup/mongodb-org-3.6.repo /etc/yum.repos.d
sudo yum install -y mongodb-org

# @TODO aha
