#! /bin/sh
apt-get update
apt-get upgrade -y

apt-get install build-essential dkms debhelper vim nodejs npm git monodevelop

echo '#! /bin/sh' > bin/install-chrome.sh
echo 'cd /tmp' >> bin/install-chrome.sh
echo 'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' >> bin/install-chrome.sh
echo 'gdebi google-chrome-stable_current_amd64.deb' >> bin/install-chrome.sh
echo 'rm google-chrome-stable_current_amd64.deb' >> bin/install-chrome.sh

echo '#! /bin/sh' > bin/install-skype.sh
echo 'cd /tmp' >> bin/install-skype.sh
echo 'wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb' >> bin/install-skype.sh
echo 'gdebi skype-ubuntu-precise_4.3.0.37-1_i386.deb' >> bin/install-skype.sh
echo 'rm skype-ubuntu-precise_4.3.0.37-1_i386.deb' >> bin/install-skype.sh

echo '#! /bin/sh' > bin/install-viber.sh
echo 'cd /tmp' >> bin/install-viber.sh
echo 'wget http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb' >> bin/install-viber.sh
echo 'gdebi viber.deb' >> bin/install-viber.sh
echo 'rm viber.deb' >> bin/install-viber.sh

echo '#! /bin/sh' > bin/install-teamviewer.sh
echo 'cd /tmp' >> bin/install-teamviewer.sh
echo 'wget http://www.teamviewer.com/download/teamviewer_linux.deb' >> bin/install-teamviewer.sh
echo 'gdebi teamviewer_linux.deb' >> bin/install-teamviewer.sh
echo 'rm teamviewer_linux.deb' >> bin/install-teamviewer.sh

echo '#! /bin/sh' > bin/install-game.sh
echo 'wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -' >> bin/install-game.sh
echo 'wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list' >> bin/install-game.sh
echo 'apt-get update' >> bin/install-game.sh
echo 'apt-get install -y wine playonlinux' >> bin/install-game.sh

echo '#! /bin/sh' > bin/install-X-utils.sh
echo 'apt-get install -y network-manager-vpnc mesa-utils expect-dev gdebi ibus-unikey' >> bin/install-X-utils.sh

which gdm && sh bin/install-X.utils.sh
which gdm && sh bin/install-chrome.sh
