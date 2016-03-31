#! /bin/sh
apt-add-repository -y ppa:fish-shell/release-2
apt-add-repository -y ppa:daniel.pavel/solaar
apt-add-repository -y 'deb http://download.virtualbox.org/virtualbox/debian'
apt-add-repository -y ppa:avsm/ocaml42+opam120

wget -O - https://deb.nodesource.com/setup_5.x | sudo bash - > /dev/null

apt-get update
apt-get upgrade -y

apt-get install -y \
  build-essential  dkms debhelper ocaml \
  vim \
  byobu fish \
  nodejs \
  python-pip \
  monodevelop \
  bluez-hcidump bluez-utils bluez-compat \

################################################
# UNISON - CLEAN UP
################################################
curl -sSL http://www.seas.upenn.edu/~bcpierce/unison//download/releases/stable/unison-2.48.3.tar.gz | tar -zxvf -
cd unison-2.48.3
make UISTYLE=text || true
cp unison           /usr/bin
cp unison-fsmonitor /usr/bin
cd ../
rm -r unison-2.48.3

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
