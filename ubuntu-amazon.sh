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
wget --no-check-certificate -qO - https://cascadia.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -
echo deb http://cascadia.corp.amazon.com/amazon $(lsb_release -cs)-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
echo deb http://cascadia.corp.amazon.com/amazon $(lsb_release -cs)-amazon-bh main | sudo tee -a /etc/apt/sources.list.d/amazon.list
echo deb http://cascadia.corp.amazon.com/amazon $(lsb_release -cs)-thirdparty-partner partner | sudo tee -a /etc/apt/sources.list.d/amazon.list
sudo apt update
sudo apt install -y amazon-ca-certificates

# Midway
if ! which mwinit >/dev/null 2>&1; then
    sudo apt install -y mwinit
    mkdir -p ~/bin
    curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh > ~/bin/mcurl
    chmod +x ~/bin/mcurl
    if [ -f ~/.ssh/primary.pem.pub ]; then
        mwinit -o -k ~/.ssh/primary.pem.pub
    else
        test -f ~/.ssh/id_rsa.pub || ssh-keygen
        mwinit -o
    fi
fi

# Kerberos
if ! which kinit >/dev/null 2>&1; then
    sudo apt install -y krb5-user
    ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R duybui.aka.amazon.com
    scp duybui.aka.amazon.com:/etc/krb5.conf ~
    sudo mv ~/krb5.conf /etc/krb5.conf
    sudo chown root:root /etc/krb5.conf
    kinit -f
fi

# Toolbox
if [ ! -e ~/.toolbox/bin/toolbox ]; then
    curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.sh' -o /tmp/toolbox-install.sh
    bash /tmp/toolbox-install.sh
    ~/.toolbox/bin/toolbox install --channel bh toolbox
fi

# CR tool
if [ ! -e ~/.toolbox/bin/cr ]; then
    ~/.toolbox/bin/toolbox install cr
fi

# Brazil 2.0
if [ ! -e ~/.toolbox/bin/brazil ]; then
    sudo apt install -y libreadline6
    ~/.toolbox/bin/toolbox install --channel bh brazilcli

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
fi

# Ninja Dev Sync
if [ ! -e ~/.toolbox/bin/ninja-dev-sync ]; then
    curl --negotiate -fu: 'https://devcentral.amazon.com/ac/brazil/package-master/package/view/NinjaDevSync%3B2.x.2.0%3BRHEL5_64%3BDEV.STD.PTHREAD%3Bbin/ninja-dev-sync.linux64' -o ~/.toolbox/bin/ninja-dev-sync
    chmod 755 ~/.toolbox/bin/ninja-dev-sync
    ln -s ~/.toolbox/bin/ninja-dev-sync ~/.toolbox/bin/nds
fi
if ! grep -q /etc/sysctl.conf -e "fs.inotify.max_user_watches"; then
    sudo apt install -y inotify-tools
    echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
fi

# AWS CLI Plugins
~/.pyenv/shims/pip install --user --no-warn-script-location git+ssh://git.amazon.com/pkg/BenderLibIsengard
~/.pyenv/shims/pip install --user --no-warn-script-location git+ssh://git.amazon.com/pkg/GoshawkBotocore@mainline-1.1
