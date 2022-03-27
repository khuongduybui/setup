#! /bin/sh

sudo apt update
sudo apt install -y autoconf bison build-essential curl gettext git libgd-dev libcurl4-openssl-dev libedit-dev libicu-dev libjpeg-dev libonig-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev
# sudo apt install -y libmariadb-dev | libmariadb-dev-compat | libmysqlclient-dev
# brew install autoconf automake bison freetype gd gettext icu4c krb5 libedit libiconv libjpeg libpng libxml2 libzip openssl@1.1 pkg-config re2c zlib
# brew install openssl@3
sudo apt install -y mlocate
sudo updatedb
PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig asdf install php 7.4.28
