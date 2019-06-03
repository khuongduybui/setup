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
sudo ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Midway
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
klist -s || kinit -f

# Toolbox
echo "--- Install Builder Toolbox ---"
toolbox update

# CR tool
echo "--- Install CR util ---"
if [ ! -e ~/.toolbox/bin/cr ]; then
    toolbox install cr
fi

# Brazil 2.0
echo "--- Install Brazil 2.0 ---"
if [ ! -e ~/.toolbox/bin/brazil ]; then
    toolbox install --channel bh brazilcli
fi

# Ninja Dev Sync
# AWS CLI Plugins
sudo chown -R duybui:amazon /apollo/env/AmazonAwsCli/
sudo chown -R duybui:amazon /apollo/env/AmazonAwsCli/python3.4/lib/
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
/apollo/env/AmazonAwsCli/bin/python /tmp/get-pip.py
/apollo/env/AmazonAwsCli/bin/python -m pip install --upgrade git+ssh://git.amazon.com/pkg/GoshawkBotocore
