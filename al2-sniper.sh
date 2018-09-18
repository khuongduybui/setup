#! /bin/sh

sudo yum install -y curl
yarn global add forever npm-check-updates electron-forge nodemon aurelia-cli @feathersjs/cli

bash ~/setup/al2-mongodb.sh

# @TODO aha
