#! /bin/bash
echo "=== Setting up global preferences ==="

test -d ~/.config/fish || mkdir -p ~/.config/fish
test -f ~/.config/fish/config.fish || ln -s ~/setup/config.fish ~/.config/fish/config.fish
test -f ~/.config/fish/fishfile || ln -s ~/setup/fishfile ~/.config/fish/fishfile
test -d ~/.config/fish/functions || ln -s ~/setup/fish-functions ~/.config/fish/functions

test -d ~/.config/micro || mkdir -p ~/.config/micro
test -f ~/.config/micro/settings.json || ln -s ~/setup/micro.json ~/.config/micro/settings.json

test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.`date +%Y-%m-%d`.bak
ln -s ~/setup/.vimrc ~/
mkdir -p ~/.config/nvim
test -f ~/.config/nvim/init.vim && mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.`date +%Y-%m-%d`.bak
ln -s ~/setup/.vimrc ~/.config/nvim/init.vim
test -d ~/.vim/bundle || mkdir -p ~/.vim/bundle
test -d ~/.vim/bundle/vundle || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle

# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage

mkdir -p ~/bin
mkdir -p ~/opt
mkdir -p ~/code/test

mkdir -p ~/.fonts
test -f ~/.fonts/source-code-pro.ttf || ln -s ~/setup/source-code-pro.ttf ~/.fonts
test -f ~/.fonts/fira-code-retina.otf || ln -s ~/setup/fira-code-retina.otf ~/.fonts
which fc-cache >/dev/null 2>&1 && sudo fc-cache -f -v

echo "=== Installing modules ==="

test -f /etc/issue &&\
grep -Ei "elementary|ubuntu" /etc/issue &&\
echo "Ubuntu detected. Installing core modules..." &&\
bash ~/setup/ubuntu.sh

which sw_vers 2>/dev/null >/dev/null &&\
echo "OS X detected. Installing core modules..." &&\
sh ~/setup/mac.sh

test -f /etc/redhat-release &&\
grep -i "Red Hat Enterprise Linux" /etc/redhat-release &&\
echo "RHEL detected. Installing core modules..." &&\
bash ~/setup/rhel.sh

test -f /etc/os-release &&\
grep -i "Amazon Linux 2" /etc/os-release &&\
echo "AL2 detected. Installing core modules..." &&\
bash ~/setup/al2.sh

test -f /etc/issue &&\
grep -i "openSUSE" /etc/issue &&\
echo "openSUSE detected. Installing core modules..." &&\
bash ~/setup/opensuse.sh

test -f /etc/issue &&\
grep -Ei "kali" /etc/issue &&\
echo "Kali detected. Installing core modules..." &&\
bash ~/setup/kali.sh

echo 'Core modules have been installed.'

echo '=== Additional modules ==='
test -f /etc/issue &&\
grep -Ei "elementary|ubuntu" /etc/issue &&\
grep -i "Microsoft" /proc/version &&\
echo "Ubuntu on Windows detected. Installing additional modules..." &&\
bash ~/setup/ubuntu-win.sh

test -f /etc/issue &&\
grep -i "openSUSE" /etc/issue &&\
which cmd.exe >/dev/null 2>&1 &&\
echo "openSUSE on Windows detected. Installing additional modules..." &&\
bash ~/setup/opensuse-win.sh

test -f /etc/redhat-release &&\
grep -i "Red Hat Enterprise Linux" /etc/redhat-release &&\
test -d /apollo/env &&\
echo "RHEL on Amazon DevDesktop detected. Installing additional modules..." &&\
bash ~/setup/rhel-amazon.sh

test -f /etc/issue &&\
grep -Ei "kali" /etc/issue &&\
grep -i "Microsoft" /proc/version &&\
echo "Kali on Windows detected. Installing additional modules..." &&\
bash ~/setup/kali-win.sh

chmod +x bin/*.sh
ls bin/*.sh

# which npm >/dev/null 2>&1 &&\
#   echo "Installing NPM tools..." &&\
#   sudo npm install -g mocha express-generator nodemon > /dev/null

# which pip >/dev/null 2>&1 &&\
#   echo "Installing virtualenv..." &&\
#   sudo pip install virtualenv nodeenv

# mkdir -p ~/.byobu
# echo 'set -g default-shell /usr/bin/fish' > ~/.byobu/.tmux.conf
# echo 'set -g default-command /usr/bin/fish' >> ~/.byobu/.tmux.conf

which gsettings 2>/dev/null && gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
echo '=== Goodbye ==='
