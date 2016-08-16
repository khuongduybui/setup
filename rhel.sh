#! /bin/sh
echo install NodeJS / NPM
test -d /apollo || curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -
# sudo yum install -y nodejs gcc gcc-c++ make # get nodejs from NodeJS apollo environment

echo install Python / PIP
which python2 && curl https://bootstrap.pypa.io/get-pip.py | python2

mv /home/duybui/.zshrc /home/duybui/.zshrc.`date +%Y-%m-%d`.bak
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-5/shells:fish:release:2.repo
yum install -y fish
cd -
echo "exec /usr/bin/fish" > /home/duybui/.zshrc
#scp duybui.aka.amazon.com:/home/duybui/.ssh/id_rsa /home/duybui/.ssh/
#scp duybui.aka.amazon.com:/home/duybui/.ssh/authorized_keys /home/duybui/.ssh/
#chmod 400 /home/duybui/.ssh/id_rsa
#git clone git@bitbucket.org:khuongduybui/linux.git /home/duybui/setup

wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/tmux-1.4-3.el5.1.x86_64.rpm
wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/byobu-5.73-4.el5.noarch.rpm
yum install -y tmux-1.4-3.el5.1.x86_64.rpm
yum install -y byobu-5.73-4.el5.noarch.rpm
#byobu-launcher-install
mv /home/duybui/.zprofile /home/duybui/.zprofile.`date +%Y-%m-%d`.bak
echo "_byobu_sourced=1 /usr/bin/byobu -S duybui attach -t 1 || /usr/bin/byobu -S duybui" > /home/duybui/.zprofile
#exec byobu-launcher

wget http://mirror.sfo12.us.leaseweb.net/epel/5/i386/epel-release-5-4.noarch.rpm
yum install -y http://mirror.sfo12.us.leaseweb.net/epel/5/i386/epel-release-5-4.noarch.rpm
