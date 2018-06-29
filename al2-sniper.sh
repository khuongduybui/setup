#! /bin/sh

sudo yum install -y curl
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn
yarn global add forever npm-check-updates electron-forge nodemon aurelia-cli @feathersjs/cli

sudo cp ~/setup/mongodb-org-3.6.repo /etc/yum.repos.d
sudo yum install -y mongodb-org

# @TODO aha
