#! /bin/sh

echo "Install package manager"

echo "Install system utils"
sudo zypper addrepo http://download.opensuse.org/repositories/shells:fish:release:2/openSUSE_Leap_42.3/shells:fish:release:2.repo
sudo zypper addrepo http://download.opensuse.org/repositories/utilities/openSUSE_Leap_42.3/utilities.repo
sudo zypper refresh
sudo zypper install -y fish vim neovim byobu
sudo zypper install -y mc screenfetch

echo "Install dev tools"
sudo zypper addrepo http://download.opensuse.org/repositories/devel:/languages:/nodejs/openSUSE_Leap_42.3/devel:languages:nodejs.repo
sudo zypper addrepo http://download.opensuse.org/repositories/Cloud:Tools/openSUSE_Leap_42.3/Cloud:Tools.repo
sudo zypper refresh
sudo zypper install -y \
  awscli \
  nodejs \
  python-devel python-pip python3-devel python3-pip \

echo "Update system"
sudo zypper update -y

which fish >/dev/null && sudo chsh -s $(which fish) $(whoami)
