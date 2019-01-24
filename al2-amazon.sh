#! /bin/bash

backup-and-link() {
    source="$1"
    destination="$2"
    [[ $2 =~ /$ ]] && destination="$2`basename $1`"
    rm -rf "$destination.`date +%Y-%m-%d`.bak"
    test -e "$destination" && mv "$destination" "$destination.`date +%Y-%m-%d`.bak"
    ln -s "$source" "$destination"
}

# Latest GIT
backup-and-link ~/setup/amazon.gitignore ~/.gitignore
backup-and-link ~/setup/amazon.gitconfig ~/.gitconfig

# Amazon
echo "--- Install Amazon repositories ---"
if ! [ -e /etc/yum.repos.d/al2-amazon.repo ]; then
    sudo cp ~/setup/al2-amazon.repo /etc/yum.repos.d
    sudo yum install -y amazon-ca-certs
fi

# Midway
echo "--- Install Midway ---"
if ! which mwinit >/dev/null 2>&1; then
    # From https://w.amazon.com/index.php/NextGenMidway/UserGuide#Linux
    sudo yum install -y amazon-midway-init
fi
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh > ~/bin/mcurl
chmod +x ~/bin/mcurl
if [ -f ~/.ssh/primary.pem.pub ]; then
    mwinit -k ~/.ssh/primary.pem.pub -l | grep -q cookie || mwinit -k ~/.ssh/primary.pem.pub -o
else
    test -f ~/.ssh/id_rsa.pub || ssh-keygen
    mwinit -l | grep -q cookie || mwinit -o
fi

# Kerberos
echo "--- Install Kerberos ---"
if ! which kinit >/dev/null 2>&1; then
    sudo yum install -y krb5-workstation
    ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R duybui.aka.amazon.com
    scp duybui.aka.amazon.com:/etc/krb5.conf ~
    sudo mv ~/krb5.conf /etc/krb5.conf
    sudo chown root:root /etc/krb5.conf
fi
klist -s || kinit -f

# Toolbox
echo "--- Install Builder Toolbox ---"
if [ ! -e ~/.toolbox/bin/toolbox ]; then
    curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.sh' -o /tmp/toolbox-install.sh
    bash /tmp/toolbox-install.sh alinux
    ~/.toolbox/bin/toolbox install --channel bh toolbox
else
    ~/.toolbox/bin/toolbox update
fi

# CR tool
echo "--- Install CR util ---"
if [ ! -e ~/.toolbox/bin/cr ]; then
    ~/.toolbox/bin/toolbox install cr
fi

# Brazil 2.0
echo "--- Install Brazil 2.0 ---"
if [ ! -e ~/.toolbox/bin/brazil ]; then
    ~/.toolbox/bin/toolbox install --channel bh brazilcli
fi

# Ninja Dev Sync
echo "--- Install Ninja Dev Sync ---"
curl --negotiate -fu: 'https://devcentral.amazon.com/ac/brazil/package-master/package/view/NinjaDevSync%3B2.x.8.0%3BRHEL5_64%3BDEV.STD.PTHREAD%3Bbin/ninja-dev-sync.linux64' -o ~/.toolbox/bin/ninja-dev-sync
chmod 755 ~/.toolbox/bin/ninja-dev-sync
rm -f ~/.toolbox/bin/nds
ln -s ~/.toolbox/bin/ninja-dev-sync ~/.toolbox/bin/nds
if ! grep -q /etc/sysctl.conf -e "fs.inotify.max_user_watches"; then
    sudo yum install -y inotify-tools
    echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
fi

# AWS CLI Plugins
echo "--- Install AWS CLI plugins ---"
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade git+ssh://git.amazon.com/pkg/BenderLibIsengard
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade git+ssh://git.amazon.com/pkg/GoshawkBotocore@mainline-1.1
