#! /bin/sh
# echo install NodeJS / NPM
# test -d /apollo || curl -sL https://rpm.nodesource.com/setup_8.x | sudo bash -
# sudo yum install -y nodejs gcc gcc-c++ make # get nodejs from NodeJS apollo environment

# echo install Python / PIP
# which python2 && curl https://bootstrap.pypa.io/get-pip.py | sudo python2

mv /home/duybui/.zshrc /home/duybui/.zshrc.`date +%Y-%m-%d`.bak
cd /etc/yum.repos.d/
sudo wget http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-5/shells:fish:release:2.repo
sudo yum install -y fish
cd -
# echo "exec /usr/bin/fish" > /home/duybui/.zshrc
# scp duybui.aka.amazon.com:/home/duybui/.ssh/id_rsa /home/duybui/.ssh/
# scp duybui.aka.amazon.com:/home/duybui/.ssh/authorized_keys /home/duybui/.ssh/
# chmod 400 /home/duybui/.ssh/id_rsa
# git clone git@bitbucket.org:khuongduybui/linux.git /home/duybui/setup

wget http://dl.fedoraproject.org/pub/archive/epel/5/i386//epel-release-5-4.noarch.rpm
sudo yum install -y epel-release-5-4.noarch.rpm
sudo yum check-update

# wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/tmux-1.4-3.el5.1.x86_64.rpm
# wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/byobu-5.73-4.el5.noarch.rpm
# yum install -y tmux-1.4-3.el5.1.x86_64.rpm
# yum install -y byobu-5.73-4.el5.noarch.rpm
sudo yum install -y byobu
# byobu-launcher-install
test -f /home/duybui/.zprofile && mv /home/duybui/.zprofile /home/duybui/.zprofile.`date +%Y-%m-%d`.bak
echo "_byobu_sourced=1 byobu -S ~/duybui new-session -A -s duybui" > /home/duybui/.zprofile
echo "set -g default-shell /usr/bin/fish" > $HOME/.byobu/.tmux.conf
echo "set -g default-command /usr/bin/fish" >> $HOME/.byobu/.tmux.conf
# exec byobu-launcher

# yum install -y w3m

sudo ln -sf /usr/share/zoneinfo/EST /etc/localtime
