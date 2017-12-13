# Amazon
wget --no-check-certificate -qO - https://cascadia.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -
echo deb http://cascadia.corp.amazon.com/amazon xenial-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
# echo deb http://cascadia.corp.amazon.com/amazon xenial--thirdparty-partner partner | sudo tee -a /etc/apt/sources.list.d/amazon.list
sudo apt update
sudo apt install -y openssh-server amazon-desktop-dhcp-config amazon-desktop-management amazon-firstboot2 amazon-firefoxconfig-dev amazon-pbis-config apt-transport-https
echo deb https://cascadia.corp.amazon.com/amazon xenial-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
sudo apt update

# Latest GIT
test -f ~/.gitignore.bak && rm ~/.gitignore.bak
test -f ~/.gitignore && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/setup/amazon.gitignore ~/.gitignore
test -f ~/.gitconfig.bak && rm ~/.gitconfig.bak
test -f ~/.gitconfig && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/setup/amazon.gitconfig ~/.gitconfig

# Midway
sudo apt install mwinit
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh > ~/bin/mcurl
chmod +x ~/bin/mcurl
test -f ~/.ssh/id_rsa.pub || ssh-keygen
mwinit -o

# Kerberos
sudo apt install -y krb5-user krb5-multidev libkrb5-dev
scp duybui.aka.amazon.com:/etc/krb5.conf ~
sudo cp ~/krb5.conf /etc/krb5.conf
sudo chown root:root /etc/krb5.conf
kinit -f

# Toolbox
curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/install-toolbox.sh' -o /tmp/install-toolbox.sh
bash /tmp/install-toolbox.sh ubuntu

~/.toolbox/bin/toolbox install cr
~/.toolbox/bin/toolbox install brazilcli

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt update
sudo apt install -y openjdk-8-jdk
~/.toolbox/bin/brazil setup --java

sudo apt install -y ruby
~/.toolbox/bin/brazil setup --ruby
