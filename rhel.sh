mv /home/duybui/.zshrc /home/duybui/.zshrc.`date +%Y-%m-%d`.bak
echo "/apollo/env/envImprovement/bin/fish" > /home/duybui/.zshrc
#scp duybui.aka.amazon.com:/home/duybui/.ssh/id_rsa /home/duybui/.ssh/
#scp duybui.aka.amazon.com:/home/duybui/.ssh/authorized_keys /home/duybui/.ssh/
#chmod 400 /home/duybui/.ssh/id_rsa
#git clone git@bitbucket.org:khuongduybui/linux.git /home/duybui/setup

wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/tmux-1.4-3.el5.1.x86_64.rpm
wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/byobu-5.73-4.el5.noarch.rpm
yum install -y tmux-1.4-3.el5.1.x86_64.rpm
yum install -y byobu-5.73-4.el5.noarch.rpm
byobu-launcher-install

#exec byobu-launcher

wget http://mirror.sfo12.us.leaseweb.net/epel/5/i386/epel-release-5-4.noarch.rpm
yum install -y http://mirror.sfo12.us.leaseweb.net/epel/5/i386/epel-release-5-4.noarch.rpm

mkdir /home/duybui/opt
echo install iojs
yum install -y gcc gcc-c++
curl https://bootstrap.pypa.io/get-pip.py | python2
