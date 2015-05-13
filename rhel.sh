mv ~/.zshrc ~/.zshrc.`date +%Y-%m-%d`.bak
echo "/apollo/env/envImprovement/bin/fish" > ~/.zshrc
scp duybui.aka.amazon.com:~/.ssh/id_rsa ~/.ssh/
scp duybui.aka.amazon.com:~/.ssh/authorized_keys ~/.ssh/
chmod 400 ~/.ssh/id_rsa
git clone git@bitbucket.org:khuongduybui/linux.git ~/setup

ln -s ~/setup/config.fish ~/.config/fish/
ln -s ~/setup/fish-functions ~/.config/fish/

wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/tmux-1.4-3.el5.1.x86_64.rpm
wget ftp://ftp.pbone.net/mirror/download.fedora.redhat.com/pub/fedora/epel/5/x86_64/byobu-5.73-4.el5.noarch.rpm
sudo yum install tmux-1.4-3.el5.1.x86_64.rpm
sudo yum install byobu-5.73-4.el5.noarch.rpm
byobu-launcher-install

exec byobu-launcher

wget http://mirror.sfo12.us.leaseweb.net/epel/5/i386/epel-release-5-4.noarch.rpm
sudo yum install http://mirror.sfo12.us.leaseweb.net/epel/5/i386/epel-release-5-4.noarch.rpm

mkdir ~/code

mkdir ~/opt
echo install iojs
sudo yum install gcc gcc-c++
mkdir ~/bin
