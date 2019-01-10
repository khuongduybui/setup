#! /bin/bash

# Latest GIT
test -f ~/.gitignore.bak && rm ~/.gitignore.bak
test -f ~/.gitignore && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/setup/amazon.gitignore ~/.gitignore
test -f ~/.gitconfig.bak && rm ~/.gitconfig.bak
test -f ~/.gitconfig && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/setup/amazon.gitconfig ~/.gitconfig

# Amazon
sudo cp ~/setup/al2-amazon.repo /etc/yum.repos.d
sudo yum install -y amazon-ca-certs

# Midway
# From https://w.amazon.com/index.php/NextGenMidway/UserGuide#Linux
sudo yum install amazon-midway-init
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh > ~/bin/mcurl
chmod +x ~/bin/mcurl
if [ -f ~/.ssh/primary.pem.pub ]; then
    mwinit -o -k ~/.ssh/primary.pem.pub
else
    test -f ~/.ssh/id_rsa.pub || ssh-keygen
    mwinit -o
fi

# Kerberos
sudo yum install -y krb5-workstation
ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R duybui.aka.amazon.com
scp duybui.aka.amazon.com:/etc/krb5.conf ~
sudo mv ~/krb5.conf /etc/krb5.conf
sudo chown root:root /etc/krb5.conf
kinit -f

# Toolbox
curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.sh' -o /tmp/toolbox-install.sh
bash /tmp/toolbox-install.sh alinux
~/.toolbox/bin/toolbox install --channel bh toolbox

# CR tool
~/.toolbox/bin/toolbox install cr

# Brazil 2.0
~/.toolbox/bin/toolbox install --channel bh brazilcli

# Ninja Dev Sync
curl --negotiate -fu: 'https://devcentral.amazon.com/ac/brazil/package-master/package/view/NinjaDevSync%3B2.x.2.0%3BRHEL5_64%3BDEV.STD.PTHREAD%3Bbin/ninja-dev-sync.linux64' -o ~/.toolbox/bin/ninja-dev-sync
chmod 755 ~/.toolbox/bin/ninja-dev-sync
ln -s ~/.toolbox/bin/ninja-dev-sync ~/.toolbox/bin/nds
sudo yum install -y inotify-tools
printf "\nfs.inotify.max_user_watches = 1000000\n" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# AWS CLI Plugins
~/.pyenv/shims/pip install --user --no-warn-script-location git+ssh://git.amazon.com/pkg/BenderLibIsengard
~/.pyenv/shims/pip install --user --no-warn-script-location git+ssh://git.amazon.com/pkg/GoshawkBotocore@mainline-1.1
