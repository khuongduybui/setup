# Amazon
wget --no-check-certificate -qO - https://cerp-master-iad.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -
echo deb https://cerp-master-iad.corp.amazon.com/amazon xenial-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
sudo apt update
sudo apt install -y openssh-server amazon-desktop-dhcp-config amazon-desktop-management amazon-firstboot2 amazon-firefoxconfig-dev amazon-pbis-config apt-transport-https

# Latest GIT
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo install -y git
ln -s ~/setup/amazon.gitignore ~/.gitignore
ln -s ~/setup/amazon.gitconfig ~/.gitconfig

# Midway
sudo apt install mwinit
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh > ~/bin/mcurl
chmod +x ~/bin/mcurl

