#! /bin/bash

curl https://gandalfn.ovh/debian/pool/main/p/pantheon-debian-repos/pantheon-debian-repos_0.4-0+pantheon+stretch+loki1_all.deb -o /tmp/pantheon-debian.deb
# curl https://gandalfn.ovh/debian/pool/main/p/pantheon-debian-repos/pantheon-debian-repos_0.5-0+pantheon+buster+juno1_all.deb -o /tmp/pantheon-debian.deb
sudo dpkg -i /tmp/pantheon-debian.deb
rm /tmp/pantheon-debian.deb

sudo apt update -y
sudo apt install -y pantheon-desktop
ls /usr/bin/io.elementary.*
ls /usr/bin/pantheon-*

# sudo mkdir -p /etc/io.elementary.appcenter
# sudo touch /etc/io.elementary.appcenter/appcenter.blacklist

# gconftool --set --type=string /orgs/pantheon/-terminal/settings/encoding UTF-8

# mkdir -p ~/.config
# ln -s ~/setup/gtk-3.0 ~/.config
