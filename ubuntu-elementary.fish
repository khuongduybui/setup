sudo apt-add-repository ppa:elementary-os/stable
sudo apt-add-repository ppa:elementary-os/testing
sudo apt-add-repository ppa:elementary-os/daily
sudo apt-add-repository ppa:versable/elementary-update
sudo apt-get update
sudo apt-get install elementary-desktop elementary-tweaks elementary-plank-extra elementary-plank-themes indicator-notifications indicator-synapse
gconftool --set --type=string /orgs/pantheon/-terminal/settings/encoding UTF-8
