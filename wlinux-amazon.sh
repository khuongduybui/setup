#! /bin/bash

# Latest GIT
test -f ~/.gitignore && mv ~/.gitignore ~/.gitignore.`date +%Y-%m-%d`.bak
ln -s ~/setup/amazon.gitignore ~/.gitignore
test -f ~/.gitconfig && mv ~/.gitconfig ~/.gitconfig.`date +%Y-%m-%d`.bak
ln -s ~/setup/amazon.gitconfig ~/.gitconfig

# Amazon
wget --no-check-certificate -qO - https://cascadia.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -
echo deb http://cascadia.corp.amazon.com/amazon xenial-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
echo deb http://cascadia.corp.amazon.com/amazon xenial-thirdparty-partner partner | sudo tee -a /etc/apt/sources.list.d/amazon.list
echo deb http://cascadia.corp.amazon.com/amazon xenial-amazon-bh main | sudo tee -a /etc/apt/sources.list.d/amazon.list
sudo apt update -y
sudo apt install -y amazon-ca-certificates

# Midway
curl http://http.us.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb -o /tmp/libssl1.0.0.deb
sudo apt install -y /tmp/libssl1.0.0.deb
sudo apt install -y mwinit
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh -o ~/bin/mcurl
chmod +x ~/bin/mcurl
if [ -f ~/.ssh/primary.pem.pub ]; then
    mwinit -o -k ~/.ssh/primary.pem.pub
else
    test -f ~/.ssh/id_rsa.pub || ssh-keygen
    mwinit -o
fi

# Kerberos
sudo apt install -y krb5-user
ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R duybui.aka.amazon.com
scp duybui.aka.amazon.com:/etc/krb5.conf ~
sudo mv ~/krb5.conf /etc/krb5.conf
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
echo 'DISTRIB_RELEASE=16.04' | sudo tee -a /etc/lsb-release
echo 'DISTRIB_CODENAME=xenial' | sudo tee -a /etc/lsb-release
echo 'DISTRIB_DESCRIPTION="Ubuntu 16.04 LTS"' | sudo tee -a /etc/lsb-release
curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.sh' -o /tmp/toolbox-install.sh
bash /tmp/toolbox-install.sh

# CR tool
~/.toolbox/bin/toolbox install cr

# Brazil 2.0
~/.toolbox/bin/toolbox install brazilcli
https://ubuntu.pkgs.org/16.04/ubuntu-main-amd64/libjpeg8-dev_8c-2ubuntu8_amd64.deb.html
curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6_6.3-8+b3_amd64.deb -o /tmp/libreadline6.deb
curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6-dev_6.3-8+b3_amd64.deb -o /tmp/libreadline6-dev.deb
sudo apt install -y /tmp/libreadline6.deb /tmp/libreadline6-dev.deb
sudo apt autoremove -y

# sudo apt install -y openjdk-11-jdk-headless
# sudo apt install -y openjdk-10-jdk-headless
# sudo apt install -y openjdk-9-jdk-headless
# sudo apt install -y openjdk-8-jdk-headless
# # sudo apt install -y openjdk-7-jdk-headless
# # sudo apt install -y openjdk-6-jdk-headless
# ~/.toolbox/bin/brazil setup --java

# ~/.nodenv/bin/nodenv install 10.13.0
# ~/.nodenv/bin/nodenv install 8.12.0
# # ~/.nodenv/bin/nodenv install 6.14.4
# ~/.toolbox/bin/brazil setup --node

# ~/.rbenv/bin/rbenv install 2.4.5
# ~/.rbenv/bin/rbenv install 2.3.8
# ~/.rbenv/bin/rbenv install 2.1.10
# ~/.rbenv/bin/rbenv install jruby-1.7.27 # 1.9 is still required for ridiculous reasons
# ~/.toolbox/bin/brazil setup --ruby

# ~/.pyenv/bin/pyenv install 3.5.6
# ~/.pyenv/bin/pyenv install 3.4.9
# ~/.pyenv/bin/pyenv install 3.3.6 # no patching provided for 3.3.7
# ~/.pyenv/bin/pyenv install 3.2.6
# ~/.pyenv/bin/pyenv install 3.1.5
# ~/.pyenv/bin/pyenv install 2.7.15
# # ~/.pyenv/bin/pyenv install 2.6.9
# # ~/.pyenv/bin/pyenv install 2.5.6
# # ~/.pyenv/bin/pyenv install 2.4.6
# ~/.toolbox/bin/brazil setup --python

# Ninja Dev Sync
curl --negotiate -fu: 'https://devcentral.amazon.com/ac/brazil/package-master/package/view/NinjaDevSync%3B2.x.2.0%3BRHEL5_64%3BDEV.STD.PTHREAD%3Bbin/ninja-dev-sync.linux64' -o ~/.toolbox/bin/ninja-dev-sync
chmod 755 ~/.toolbox/bin/ninja-dev-sync
ln -s ~/.toolbox/bin/ninja-dev-sync ~/.toolbox/bin/nds
sudo apt install -y inotify-tools
echo "fs.inotify.max_user_watches = 1000000" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# AWS CLI Plugins
~/.pyenv/shims/pip install --user --no-warn-script-location git+ssh://git.amazon.com/pkg/BenderLibIsengard
~/.pyenv/shims/pip install --user --no-warn-script-location git+ssh://git.amazon.com/pkg/GoshawkBotocore@mainline-1.1
