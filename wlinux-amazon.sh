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

# sudo apt-get install git-core autoconf libtool gettext autopoint automake autogen nettle-dev libp11-kit-dev libtspi-dev guile-2.0-dev    libtasn1-6-dev libidn11-dev gawk gperf git2cl libunbound-dev bison help2man gtk-doc-tools texinfo texlive texlive-generic-recommended texlive-extra-utils librtmp-dev zlib1g-dev cmake libldap2-dev libgmp-dev pkg-config libudev-dev libusb-dev libgss3 libgssapi-krb5-2 libgss-dev libgnutls-dev libsasl2-dev libshishi-dev libgcrypt20-dev libdb5.3-dev libgpg-error-dev libsqlite3-dev libmysqlclient-dev libpq-dev libc-dev libfox-1.6-dev libcomerr2 make krb5-user libusb-1.0-0-dev g++

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

# Toolbox
curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/BuilderToolbox/toolbox-install.sh' -o /tmp/toolbox-install.sh
bash /tmp/toolbox-install.sh ubuntu

# CR tool
~/.toolbox/bin/toolbox install cr

# Brazil 2.0
sudo apt install -y openjdk-8-jdk-headless
~/.toolbox/bin/toolbox install brazilcli
# @TODO brazil 2.0 fails with
# WARN[0000] Unable to determine Linux platform, defaulting to alinux
# /apollo is empty

# WORKAROUND:
# mv ~/.toolbox ~/.toolbox.bak
# cp ~/.toolbox & /apollo from Ubuntu over
# curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6_6.3-8+b3_amd64.deb -o /tmp/libreadline6.deb
# curl http://http.us.debian.org/debian/pool/main/r/readline6/libreadline6-dev_6.3-8+b3_amd64.deb -o /tmp/libreadline6-dev.deb
# sudo apt install -y /tmp/libreadline6.deb /tmp/libreadline6-dev.deb
# edit /home/duybui/.toolbox/tools/brazilcli/2.0.200620.0/ruby2.1.x/lib/ruby/site_ruby/2.1.0/amazon/brazil/any_os/linux.rb
# 111   #
# 112   # Assume Ubuntu (at this time)
# 113   #
# 114   def self.lsb_release
# 115     path = '/etc/lsb-release'
# 116     path2 = '/etc/os-release'
# 117     return nil unless File.exist?(path) or File.exists?(path2)
# 118     if File.exist?(path)
# 119       if File.open(path, 'rb'){ |f| f.read } =~ /^DISTRIB_ID=Ubuntu/
# 120         return "UBUNTU"
# 121       end
# 122     end
# 123     if File.exist?(path2)
# 124       if File.open(path2, 'rb'){ |f| f.read } =~ /WLinux/
# 125         return "UBUNTU"
# 126       end
# 127     end
# 128     return nil
# 129     raise "Unrecognized LSB release"
# 130   end

# ~/.toolbox/bin/brazil setup --java
# ~/.toolbox/bin/brazil setup --ruby
# ~/.toolbox/bin/brazil setup --python

# Ninja Dev Sync
curl --negotiate -fu: 'https://devcentral.amazon.com/ac/brazil/package-master/package/view/NinjaDevSync%3B2.1.0.0%3BRHEL5_64%3BDEV.STD.PTHREAD%3Bbin/ninja-dev-sync.linux64' -o ~/.toolbox/bin/ninja-dev-sync
chmod 755 ~/.toolbox/bin/ninja-dev-sync
ln -s ~/.toolbox/bin/ninja-dev-sync ~/.toolbox/bin/nds
sudo apt install -y inotify-tools
echo "fs.inotify.max_user_watches = 1000000" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
