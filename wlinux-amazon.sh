#! /bin/sh

# Latest GIT
test -f ~/.gitignore.bak && rm ~/.gitignore.bak
test -f ~/.gitignore && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/setup/amazon.gitignore ~/.gitignore
test -f ~/.gitconfig.bak && rm ~/.gitconfig.bak
test -f ~/.gitconfig && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/setup/amazon.gitconfig ~/.gitconfig

# Amazon
wget --no-check-certificate -qO - https://cascadia.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -
echo deb http://cascadia.corp.amazon.com/amazon trusty-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
echo deb http://cascadia.corp.amazon.com/amazon trusty-thirdparty-partner partner | sudo tee -a /etc/apt/sources.list.d/amazon.list
echo deb http://cascadia.corp.amazon.com/amazon trusty-amazon-bh main | sudo tee -a /etc/apt/sources.list.d/amazon.list
# echo deb http://cascadia.corp.amazon.com/upstream trusty main restricted universe | sudo tee -a /etc/apt/sources.list.d/amazon.list
# echo deb http://cascadia.corp.amazon.com/upstream trusty-updates main restricted universe | sudo tee -a /etc/apt/sources.list.d/amazon.list
# echo deb http://cascadia.corp.amazon.com/upstream trusty-backports main restricted universe | sudo tee -a /etc/apt/sources.list.d/amazon.list
# echo deb http://cascadia.corp.amazon.com/upstream trusty-security main restricted universe | sudo tee -a /etc/apt/sources.list.d/amazon.list
sudo apt update
sudo apt install -y amazon-desktop-management

# Midway
curl http://http.us.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb -o /tmp/libssl1.0.0.deb
sudo apt install -y /tmp/libssl1.0.0.deb
sudo apt install -y mwinit
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh -o ~/bin/mcurl
chmod +x ~/bin/mcurl
test -f ~/.ssh/id_rsa.pub || ssh-keygen
mwinit -o

# Kerberos
sudo apt install -y krb5-user # krb5-multidev libkrb5-dev
ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R duybui.aka.amazon.com
scp duybui.aka.amazon.com:/etc/krb5.conf ~
sudo cp ~/krb5.conf /etc/krb5.conf
sudo chown root:root /etc/krb5.conf
kinit -f
# If you have problems with your Kerberos credentials syncing to your xrdp session:
# Then add the following under the [libdefaults] section in /etc/krb5.conf:
# default_ccache_name = /tmp/krb5cc_%{uid}

# yubi_age=$(( $(date +"%s") - $(stat -c "%Y" ~/.ssh/id_rsa-cert.pub) ))
# if [ "$yubi_age" -gt "36000" ] || ! klist -s; then
#     PASSWD=$(systemd-ask-password)
#     # Kinit checker
#     if ! klist -s; then
#         kinit -f <<< "$PASSWD" > /dev/null
#     fi
#     # mwinit checker
#     if [ "$yubi_age" -gt "36000" ]; then
#         mwinit -o < <(echo "$PASSWD" && cat) | sed -n '1!p'
#     fi
#     env -u PASSWD > /dev/null
# fi

# Toolbox
echo 'DISTRIB_ID=Ubuntu' | sudo tee /etc/lsb-release
echo 'DISTRIB_RELEASE=14.04' | sudo tee -a /etc/lsb-release
echo 'DISTRIB_CODENAME=trusty' | sudo tee -a /etc/lsb-release
echo 'DISTRIB_DESCRIPTION="Ubuntu 14.04 LTS"' | sudo tee -a /etc/lsb-release
curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.sh' -o /tmp/toolbox-install.sh
bash /tmp/toolbox-install.sh

# CR tool
~/.toolbox/bin/toolbox install cr

# Brazil 2.0
sudo apt install -y openjdk-8-jdk-headless
~/.toolbox/bin/toolbox install brazilcli
# curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6_6.3-8+b3_amd64.deb -o /tmp/libreadline6.deb
# curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6-dev_6.3-8+b3_amd64.deb -o /tmp/libreadline6-dev.deb
# sudo apt install -y /tmp/libreadline6.deb /tmp/libreadline6-dev.deb

~/.toolbox/bin/brazil setup --java
~/.toolbox/bin/brazil setup --ruby
~/.toolbox/bin/brazil setup --python

# Ninja Dev Sync
curl --negotiate -fu: 'https://devcentral.amazon.com/ac/brazil/package-master/package/view/NinjaDevSync%3B2.1.0.0%3BRHEL5_64%3BDEV.STD.PTHREAD%3Bbin/ninja-dev-sync.linux64' -o ~/.toolbox/bin/ninja-dev-sync
chmod 755 ~/.toolbox/bin/ninja-dev-sync
ln -s ~/.toolbox/bin/ninja-dev-sync ~/.toolbox/bin/nds
sudo apt install -y inotify-tools
echo "fs.inotify.max_user_watches = 1000000" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
