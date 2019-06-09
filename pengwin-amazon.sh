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
if ! [ -e /etc/apt/sources.list.d/amazon.list ]; then
    wget --no-check-certificate -qO - https://cascadia.corp.amazon.com/amazon/clienteng.gpg | sudo apt-key add -
    echo deb http://cascadia.corp.amazon.com/amazon bionic-amazon main | sudo tee /etc/apt/sources.list.d/amazon.list
    echo deb http://cascadia.corp.amazon.com/amazon bionic-thirdparty-partner partner | sudo tee -a /etc/apt/sources.list.d/amazon.list
    echo deb http://cascadia.corp.amazon.com/amazon bionic-amazon-bh main | sudo tee -a /etc/apt/sources.list.d/amazon.list
    sudo apt update -y
    sudo apt install -y amazon-ca-certificates amazon-security-bastion-prod
    /opt/amazon/bin/security-bastion-setup.sh
fi

# Midway
echo "--- Install Midway ---"
if ! which mwinit >/dev/null 2>&1; then
    curl http://http.us.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb -o /tmp/libssl1.0.0.deb
    sudo apt install -y /tmp/libssl1.0.0.deb
    sudo apt install -y mwinit
fi
mkdir -p ~/bin
curl https://s3.amazonaws.com/com.amazon.aws.midway.software/linux/mcurl.sh -o ~/bin/mcurl
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
    sudo apt install -y krb5-user
fi
if getent hosts duybui.aka.amazon.com >/dev/null; then
    ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R duybui.aka.amazon.com
    scp duybui.aka.amazon.com:/etc/krb5.conf ~
    cp ~/krb5.conf ~/setup/amazon-krb5.conf
    sudo mv ~/krb5.conf /etc/krb5.conf
else
    sudo cp ~/setup/amazon-krb5.conf /etc/krb5.conf
fi
sudo chown root:root /etc/krb5.conf
klist -s || kinit -f

# Toolbox
echo "--- Install Builder Toolbox ---"
if [ ! -e ~/.toolbox/bin/toolbox ]; then
    echo 'DISTRIB_ID=Ubuntu' | sudo tee /etc/lsb-release
    echo 'DISTRIB_RELEASE=18.04' | sudo tee -a /etc/lsb-release
    echo 'DISTRIB_CODENAME=bionic' | sudo tee -a /etc/lsb-release
    echo 'DISTRIB_DESCRIPTION="Ubuntu 18.04 LTS"' | sudo tee -a /etc/lsb-release
    echo 'deb https://deb.debian.org/debian stable main contrib non-free' | sudo tee /etc/apt/sources.list.d/stretch.list
    echo 'deb https://deb.debian.org/debian stable-updates main' | sudo tee -a /etc/apt/sources.list.d/stretch.list
    echo 'deb https://deb.debian.org/debian-security stable/updates main' | sudo tee -a /etc/apt/sources.list.d/stretch.list
    sudo apt update -y
    sudo apt install -y --allow-downgrades curl=7.52.1-5+deb9u8 libcurl3=7.52.1-5+deb9u8
    sudo apt-mark hold curl libcurl3

    curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.sh' -o /tmp/toolbox-install.sh
    bash /tmp/toolbox-install.sh
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
    curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6_6.3-8+b3_amd64.deb -o /tmp/libreadline6.deb
    curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6-dev_6.3-8+b3_amd64.deb -o /tmp/libreadline6-dev.deb
    sudo apt install -y /tmp/libreadline6.deb /tmp/libreadline6-dev.deb
    sudo apt autoremove -y
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
echo "--- Install Ninja Dev Sync ---"
curl --negotiate -fu: 'https://devcentral.amazon.com/ac/brazil/package-master/package/view/NinjaDevSync%3B2.x.8.0%3BRHEL5_64%3BDEV.STD.PTHREAD%3Bbin/ninja-dev-sync.linux64' -o ~/.toolbox/bin/ninja-dev-sync
chmod 755 ~/.toolbox/bin/ninja-dev-sync
rm -f ~/.toolbox/bin/nds
ln -s ~/.toolbox/bin/ninja-dev-sync ~/.toolbox/bin/nds
if ! grep -q /etc/sysctl.conf -e "fs.inotify.max_user_watches"; then
    sudo apt install -y inotify-tools
    echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
fi

# AWS CLI Plugins
echo "--- Install AWS CLI plugins ---"
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade git+ssh://git.amazon.com/pkg/BenderLibIsengard
~/.pyenv/shims/pip install --user --no-warn-script-location --upgrade git+ssh://git.amazon.com/pkg/GoshawkBotocore@mainline-1.1
