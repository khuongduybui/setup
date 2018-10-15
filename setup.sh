#! /bin/bash
echo "=== Setting up global preferences ==="

mkdir -p ~/.config/fish/conf.d
test -f ~/.config/fish/conf.d/$USER.fish || ln -s ~/setup/config.fish ~/.config/fish/conf.d/$USER.fish
test -f ~/.config/fish/fishfile || ln -s ~/setup/fishfile ~/.config/fish/fishfile
test -d ~/.config/fish/functions || ln -s ~/setup/fish-functions ~/.config/fish/functions

test -d ~/.config/powershell && mv ~/.config/powershell ~/.config/powershell.`date +%Y-%m-%d`.bak
ln -s ~/setup/WindowsPowerShell ~/.config/powershell

mkdir -p ~/.config/micro
test -f ~/.config/micro/settings.json || ln -s ~/setup/micro.json ~/.config/micro/settings.json

mkdir -p ~/.config/bark
test -d ~/.config/bark/profiles || ln -s ~/setup/bark-profiles ~/.config/bark/profiles

test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.`date +%Y-%m-%d`.bak
ln -s ~/setup/.vimrc ~/
mkdir -p ~/.config/nvim
test -f ~/.config/nvim/init.vim && mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.`date +%Y-%m-%d`.bak
ln -s ~/setup/.vimrc ~/.config/nvim/init.vim
test -d ~/.vim/bundle || mkdir -p ~/.vim/bundle
test -d ~/.vim/bundle/vundle || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle

test -f ~/.czrc && mv ~/.czrc ~/.czrc.`date +%Y-%m-%d`.bak
ln -s ~/setup/.czrc ~/

test -f ~/.editorconfig && mv ~/.editorconfig ~/.editorconfig.`date +%Y-%m-%d`.bak
ln -s ~/setup/.editorconfig ~/
test -f ~/.gitconfig && mv ~/.gitconfig ~/.gitconfig.`date +%Y-%m-%d`.bak
ln -s ~/setup/default.gitconfig ~/.gitconfig
test -f ~/.gitignore && mv ~/.gitignore ~/.gitignore.`date +%Y-%m-%d`.bak
ln -s ~/setup/default.gitignore ~/.gitignore

# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage

mkdir -p ~/bin
mkdir -p ~/opt
mkdir -p ~/code/test

# @TODO: ArchLinux
test -d /usr/share/fonts/trutype && sudo cp ~/setup/Fira*.ttf /usr/share/fonts/truetype
which fc-cache >/dev/null 2>&1 && sudo fc-cache -f -v

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
grep -q -i "Amazon Linux" /etc/os-release &&\
echo "AL2 detected. Installing core modules..." &&\
bash ~/setup/al2.sh

test -f /etc/os-release &&\
grep -q -i "WLinux" /etc/os-release &&\
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

echo 'Core modules have been installed.'

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
grep -q -i "WLinux" /etc/os-release &&\
grep -q -i "Microsoft" /proc/version &&\
echo "WLinux on Windows detected. Installing additional modules..." &&\
bash ~/setup/wlinux-win.sh

test -f /etc/os-release &&\
grep -q -i "WLinux" /etc/os-release &&\
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

which yarn >/dev/null && yarn global add commitizen cz-conventional-changelog npm/tink forever eslint
which pip3 >/dev/null && pip3 install --user pylint autopep8
which gem >/dev/null && gem install rubocop rufo

# mkdir -p ~/.byobu
# echo 'set -g default-shell /usr/bin/fish' > ~/.byobu/.tmux.conf
# echo 'set -g default-command /usr/bin/fish' >> ~/.byobu/.tmux.conf

which gsettings 2>/dev/null && gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
echo '=== Goodbye ==='
