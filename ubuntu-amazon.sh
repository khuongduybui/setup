# Amazon
wget --no-check-certificate -qO - https://cascadia.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -
echo deb http://cascadia.corp.amazon.com/amazon xenial-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
# echo deb http://cascadia.corp.amazon.com/amazon xenial--thirdparty-partner partner | sudo tee -a /etc/apt/sources.list.d/amazon.list
sudo apt update
sudo apt install -y openssh-server amazon-desktop-dhcp-config amazon-desktop-management amazon-firstboot2 amazon-firefoxconfig-dev amazon-pbis-config apt-transport-https

# Latest GIT
test -f ~/.gitignore && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/setup/amazon.gitignore ~/.gitignore
test -f ~/.gitconfig && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/setup/amazon.gitconfig ~/.gitconfig

# Midway
sudo apt install mwinit
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh > ~/bin/mcurl
chmod +x ~/bin/mcurl

