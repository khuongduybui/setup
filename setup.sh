#! /bin/bash

backup-and-link() {
    source="$1"
    destination="$2"
    [[ $2 =~ /$ ]] && destination="$2`basename $1`"
    rm -rf "$destination.`date +%Y-%m-%d`.bak"
    test -e "$destination" && mv "$destination" "$destination.`date +%Y-%m-%d`.bak"
    ln -s "$source" "$destination"
}

echo "=== Setting up global preferences ==="

mkdir -p ~/.config
backup-and-link ~/setup/gtk-3.0 ~/.config/
backup-and-link ~/setup/gtk-2.0/gtkrc ~/.gtkrc-2.0

mkdir -p ~/.config/fish/conf.d
backup-and-link ~/setup/config.fish ~/.config/fish/conf.d/$USER.fish
backup-and-link ~/setup/fishfile ~/.config/fish/
backup-and-link ~/setup/fish-functions ~/.config/fish/functions

backup-and-link ~/setup/WindowsPowerShell ~/.config/powershell

mkdir -p ~/.config/sublime-text-3/Packages/User
backup-and-link ~/setup/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/

mkdir -p ~/.config/micro
backup-and-link ~/setup/micro.json ~/.config/micro/settings.json

mkdir -p ~/.config/bark
backup-and-link ~/setup/bark-profiles ~/.config/bark/profiles

backup-and-link ~/setup/.vimrc ~/
mkdir -p ~/.config/nvim
backup-and-link ~/setup/.vimrc ~/.config/nvim/init.vim
mkdir -p ~/.vim/bundle
if [ -d ~/.vim/bundle/vundle ]; then
    cd ~/.vim/bundle/vundle; git pull; cd -
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
fi

backup-and-link ~/setup/.editorconfig ~/

backup-and-link ~/setup/.czrc ~/
backup-and-link ~/setup/default.gitconfig ~/.gitconfig
backup-and-link ~/setup/default.gitignore ~/.gitignore

mkdir -p ~/bin
mkdir -p ~/opt
mkdir -p ~/code/test/src

echo "=== Installing modules ==="

test -f /etc/issue &&\
grep -q -Ei "arch" /etc/issue &&\
echo "Arch Linux detected. Installing core modules..." &&\
bash ~/setup/arch.sh

test -f /etc/issue &&\
grep -q -Ei "elementary|ubuntu" /etc/issue &&\
echo "Ubuntu detected. Installing core modules..." &&\
bash ~/setup/ubuntu.sh

which sw_vers 2>/dev/null >/dev/null &&\
echo "OS X detected. Installing core modules..." &&\
sh ~/setup/mac.sh

test -f /etc/redhat-release &&\
grep -q -i "Red Hat Enterprise Linux" /etc/redhat-release &&\
echo "RHEL detected. Installing core modules..." &&\
bash ~/setup/rhel.sh

test -f /etc/os-release &&\
grep -q -i "Amazon Linux 2" /etc/os-release &&\
echo "AL2 detected. Installing core modules..." &&\
bash ~/setup/al2.sh

which wslsys >/dev/null 2>&1 &&\
wslsys 2>&1 | grep -q "WLinux" &&\
echo "WLinux detected. Installing core modules..." &&\
bash ~/setup/wlinux.sh

test -f /etc/issue &&\
grep -q -i "openSUSE" /etc/issue &&\
echo "openSUSE detected. Installing core modules..." &&\
bash ~/setup/opensuse.sh

test -f /etc/issue &&\
grep -q -Ei "kali" /etc/issue &&\
echo "Kali detected. Installing core modules..." &&\
bash ~/setup/kali.sh

echo '=== Additional modules ==='

test -f /etc/issue &&\
grep -q -Ei "arch" /etc/issue &&\
grep -q -i "Microsoft" /proc/version &&\
echo "Arch Linux on Windows detected. Installing core modules..." &&\
bash ~/setup/arch-win.sh

test -f /etc/issue &&\
grep -q -Ei "elementary|ubuntu" /etc/issue &&\
grep -q -i "Microsoft" /proc/version &&\
echo "Ubuntu on Windows detected. Installing additional modules..." &&\
bash ~/setup/ubuntu-win.sh

test -f /etc/issue &&\
grep -q -Ei "elementary|ubuntu" /etc/issue &&\
hostname -d | grep -q ant.amazon.com &&\
echo "Ubuntu on Amazon device detected. Installing additional modules..." &&\
bash ~/setup/ubuntu-amazon.sh

which sw_vers 2>/dev/null >/dev/null &&\
hostname -d | grep -q ant.amazon.com &&\
echo "OS X on Amazon device detected. Installing additional modules..." &&\
bash ~/setup/mac-amazon.sh

test -f /etc/redhat-release &&\
grep -q -i "Red Hat Enterprise Linux" /etc/redhat-release &&\
test -d /apollo/env &&\
echo "RHEL on Amazon DevDesktop detected. Installing additional modules..." &&\
bash ~/setup/rhel-amazon.sh

test -f /etc/os-release &&\
grep -q -i "Amazon Linux 2" /etc/os-release &&\
grep -q -i "Microsoft" /proc/version &&\
echo "AL2 on Windows detected. Installing additional modules..." &&\
bash ~/setup/al2-win.sh

test -f /etc/os-release &&\
grep -q -i "Amazon Linux 2" /etc/os-release &&\
hostname -d | grep -q ant.amazon.com &&\
echo "AL2 on Amazon device detected. Installing additional modules..." &&\
bash ~/setup/al2-amazon.sh

which wslsys >/dev/null 2>&1 &&\
wslsys 2>&1 | grep -q "WLinux" &&\
grep -q -i "Microsoft" /proc/version &&\
echo "WLinux on Windows detected. Installing additional modules..." &&\
bash ~/setup/wlinux-win.sh

which wslsys >/dev/null 2>&1 &&\
wslsys 2>&1 | grep -q "WLinux" &&\
hostname -d | grep -q ant.amazon.com &&\
echo "WLinux on Amazon device detected. Installing additional modules..." &&\
bash ~/setup/wlinux-amazon.sh

test -f /etc/issue &&\
grep -q -i "openSUSE" /etc/issue &&\
which cmd.exe >/dev/null 2>&1 &&\
echo "openSUSE on Windows detected. Installing additional modules..." &&\
bash ~/setup/opensuse-win.sh

test -f /etc/issue &&\
grep -q -Ei "kali" /etc/issue &&\
grep -q -i "Microsoft" /proc/version &&\
echo "Kali on Windows detected. Installing additional modules..." &&\
bash ~/setup/kali-win.sh

test -f /etc/issue &&\
grep -q -Ei "kali" /etc/issue &&\
hostname -d | grep -q ant.amazon.com &&\
echo "Kali on Amazon device detected. Installing additional modules..." &&\
bash ~/setup/kali-amazon.sh

echo '=== Common development tools ==='

test -x ~/.nodenv/bin/nodenv && eval "$(~/.nodenv/bin/nodenv init -)"
which node 2>&1 | grep -q -v mnt &&\
which yarn 2>&1 | grep -q -v mnt &&\
yarn global add forever eslint neovim

test -x ~/.pyenv/bin/pyenv && eval "$(~/.pyenv/bin/pyenv init -)"
which pip 2>&1 | grep -q -v mnt &&\
pip install --user --no-warn-script-location --upgrade pip pylint autopep8 neovim

test -x ~/.rbenv/bin/rbenv && eval "$(~/.rbenv/bin/rbenv init -)"
which gem 2>&1 | grep -q -v mnt &&\
gem install rubocop rufo neovim
rbenv rehash

echo '=== Goodbye ==='
