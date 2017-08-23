#! /bin/sh

sudo zypper addrepo http://download.opensuse.org/repositories/shells:fish:release:2/openSUSE_Leap_42.2/shells:fish:release:2.repo
sudo zypper addrepo http://download.opensuse.org/repositories/utilities/openSUSE_Leap_42.2/utilities.repo

sudo zypper refresh
sudo zypper update

sudo zypper install \
  vim \
  byobu fish mc screenfetch \
  nodejs4 \

sudo chsh -s $(which fish) $(whoami)
