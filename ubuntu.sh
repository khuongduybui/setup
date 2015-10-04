#! /bin/sh
apt-add-repository -y ppa:fish-shell/release-2
apt-add-repository -y ppa:daniel.pavel/solaar
apt-add-repository -y 'deb http://download.virtualbox.org/virtualbox/debian'

wget -O - https://deb.nodesource.com/setup | sudo bash - > /dev/null

apt-get update
apt-get upgrade -y

apt-get install -y \
  build-essential  dkms debhelper \
  vim \
  byobu fish \
  nodejs \
  python-pip \
  git \
  monodevelop \
  bluez-hcidump bluez-utils bluez-compat \

echo '#! /bin/sh' > ~/bin/install-chrome.sh
echo 'cd /tmp' >> ~/bin/install-chrome.sh
echo 'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' >> ~/bin/install-chrome.sh
echo 'sudo gdebi -n google-chrome-stable_current_amd64.deb' >> ~/bin/install-chrome.sh
echo 'rm google-chrome-stable_current_amd64.deb' >> ~/bin/install-chrome.sh

echo '#! /bin/sh' > ~/bin/install-skype.sh
echo 'cd /tmp' >> ~/bin/install-skype.sh
echo 'wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb' >> ~/bin/install-skype.sh
echo 'sudo gdebi -n skype-ubuntu-precise_4.3.0.37-1_i386.deb' >> ~/bin/install-skype.sh
echo 'rm skype-ubuntu-precise_4.3.0.37-1_i386.deb' >> ~/bin/install-skype.sh

echo '#! /bin/sh' > ~/bin/install-viber.sh
echo 'cd /tmp' >> ~/bin/install-viber.sh
echo 'wget http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb' >> ~/bin/install-viber.sh
echo 'sudo gdebi -n viber.deb' >> ~/bin/install-viber.sh
echo 'rm viber.deb' >> ~/bin/install-viber.sh

echo '#! /bin/sh' > ~/bin/install-teamviewer.sh
echo 'cd /tmp' >> ~/bin/install-teamviewer.sh
echo 'wget http://www.teamviewer.com/download/teamviewer_linux.deb' >> ~/bin/install-teamviewer.sh
echo 'sudo gdebi -n teamviewer_linux.deb' >> ~/bin/install-teamviewer.sh
echo 'rm teamviewer_linux.deb' >> ~/bin/install-teamviewer.sh

echo '#! /bin/sh' > ~/bin/install-game.sh
echo 'wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -' >> ~/bin/install-game.sh
echo 'wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list' >> ~/bin/install-game.sh
echo 'sudo apt-get update' >> ~/bin/install-game.sh
echo 'sudo apt-get install -y wine playonlinux' >> ~/bin/install-game.sh

echo '#! /bin/sh' > ~/bin/install-X-utils.sh
echo 'sudo apt-get install -y network-manager-vpnc mesa-utils expect-dev gdebi ibus ibus-gtk ibus-qt4 ibus-unikey solaar' >> ~/bin/install-X-utils.sh

echo '#! /bin/sh' > ~/bin/install-noX-utils.sh
echo 'git clone https://git.lekensteyn.nl/ltunify.git /tmp/ltunify' >> ~/bin/install-noX-utils.sh
echo 'cd /tmp/ltunify' >> ~/bin/install-noX-utils.sh
echo 'sudo make install-home' >> ~/bin/install-noX-utils.sh
echo 'gconftool --set --type=string /apps/gnome-terminal/profiles/Default/encoding UTF-8' >> ~/bin/install-noX-utils.sh

which gdm && sh ~/bin/install-X-utils.sh || sh ~/bin/install-noX-utils.sh
which gdm && (which google-chrome || sh ~/bin/install-chrome.sh)
