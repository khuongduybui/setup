#! /bin/bash

echo "=== Setting up global preferences ==="

mkdir -p ~/.config
bash ~/setup/backup-and-link.sh ~/setup/gtk-3.0 ~/.config/
bash ~/setup/backup-and-link.sh ~/setup/gtk-2.0/gtkrc ~/.gtkrc-2.0

mkdir -p ~/.config/fish/conf.d
bash ~/setup/backup-and-link.sh ~/setup/config.fish ~/.config/fish/conf.d/$USER.fish
bash ~/setup/backup-and-link.sh ~/setup/fishfile ~/.config/fish/fish_plugins
bash ~/setup/backup-and-link.sh ~/setup/fish-functions ~/.config/fish/functions

bash ~/setup/backup-and-link.sh ~/setup/WindowsPowerShell ~/.config/powershell

bash ~/setup/backup-and-link.sh ~/setup/starship.toml ~/.config/

mkdir -p ~/.config/sublime-text-3/Packages/User
bash ~/setup/backup-and-link.sh ~/setup/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/

mkdir -p ~/.config/micro
bash ~/setup/backup-and-link.sh ~/setup/micro.json ~/.config/micro/settings.json

bash ~/setup/backup-and-link.sh ~/setup/.vimrc ~/
mkdir -p ~/.config/nvim
bash ~/setup/backup-and-link.sh ~/setup/.vimrc ~/.config/nvim/init.vim
mkdir -p ~/.vim/bundle
if [ -d ~/.vim/bundle/vundle ]; then
    cd ~/.vim/bundle/vundle
    git pull
    cd -
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
fi

bash ~/setup/backup-and-link.sh ~/setup/.editorconfig ~/

bash ~/setup/backup-and-link.sh ~/setup/.czrc ~/
bash ~/setup/backup-and-link.sh ~/setup/default.gitconfig ~/.gitconfig
bash ~/setup/backup-and-link.sh ~/setup/default.gitignore ~/.gitignore
mkdir -p ~/.config/gh
bash ~/setup/backup-and-link.sh ~/setup/gh/config.yml ~/.config/gh/

bash ~/setup/backup-and-link.sh ~/setup/.password-store ~/
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
bash ~/setup/backup-and-link.sh ~/setup/gpg.conf ~/.gnupg/gpg.conf

mkdir -p ~/bin
mkdir -p ~/opt
mkdir -p ~/code

if [ ! -f /.dockerenv ]; then
    echo "=== Installing modules ==="

    test -f /etc/issue &&
        grep -q -Ei "arch" /etc/issue &&
        echo "Arch Linux detected. Installing core modules..." &&
        bash ~/setup/arch.sh

    test -f /etc/issue &&
        grep -q -Ei "elementary|ubuntu" /etc/issue &&
        echo "Ubuntu detected. Installing core modules..." &&
        bash ~/setup/ubuntu.sh

    test -f /etc/issue &&
        grep -q -Ei "elementary" /etc/issue &&
        echo "ElementaryOS detected. Installing additional modules..." &&
        bash ~/setup/elementary.sh

    which sw_vers 2>/dev/null >/dev/null &&
        echo "OS X detected. Installing core modules..." &&
        sh ~/setup/mac.sh

    test -f /etc/redhat-release &&
        grep -q -i "Red Hat Enterprise Linux" /etc/redhat-release &&
        echo "RHEL detected. Installing core modules..." &&
        bash ~/setup/rhel.sh

    test -f /etc/os-release &&
        grep -q -i "Amazon Linux 2" /etc/os-release &&
        echo "AL2 detected. Installing core modules..." &&
        bash ~/setup/al2.sh

    test -f /etc/os-release &&
        grep -q -i "clear-linux-os" /etc/os-release &&
        echo "Clear Linux detected. Installing core modules..." &&
        bash ~/setup/clear.sh

    test -f /etc/os-release &&
        grep -q -i "Pengwin" /etc/os-release &&
        echo "Pengwin detected. Installing core modules..." &&
        bash ~/setup/pengwin.sh

    test -f /etc/issue &&
        grep -q -i "openSUSE" /etc/issue &&
        echo "openSUSE detected. Installing core modules..." &&
        bash ~/setup/opensuse.sh

    test -f /etc/issue &&
        grep -q -Ei "kali" /etc/issue &&
        echo "Kali detected. Installing core modules..." &&
        bash ~/setup/kali.sh

    if grep -q -i "Microsoft" /proc/version; then
        echo '=== WSL detected. Running additional config ==='
        bash ~/setup/linux-win.sh

        test -f /etc/issue &&
            grep -q -Ei "elementary|ubuntu" /etc/issue &&
            grep -q -i "Microsoft" /proc/version &&
            echo "Ubuntu on Windows detected. Installing additional modules..." &&
            bash ~/setup/ubuntu-win.sh

        test -f /etc/os-release &&
            grep -q -i "Pengwin" /etc/os-release &&
            grep -q -i "Microsoft" /proc/version &&
            echo "Pengwin on Windows detected. Installing additional modules..." &&
            bash ~/setup/pengwin-win.sh

        test -f /etc/issue &&
            grep -q -Ei "kali" /etc/issue &&
            grep -q -i "Microsoft" /proc/version &&
            echo "Kali on Windows detected. Installing additional modules..." &&
            bash ~/setup/kali-win.sh
    fi
fi

echo '=== Common shell tools ==='
~/setup/linux-starship.sh
~/setup/linux-bat.sh
~/setup/linux-exa.sh
~/setup/linux-delta.sh
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | sh
~/setup/linux-nu.sh

echo '=== Common development tools ==='
bash ~/setup/linux-inotify.sh
bash ~/setup/linux-micro.sh
bash ~/setup/linux-aws-cli-v2.sh

if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi
. ~/.asdf/asdf.sh
mkdir -p ~/.config/fish/completions
cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
asdf update
asdf plugin update --all

asdf plugin add deno
asdf install deno latest
asdf global deno $(asdf latest deno)
bash ~/setup/shell-utils/install.sh

asdf plugin add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs latest
asdf global nodejs $(asdf latest nodejs)
npm install -g npm@latest yarn@latest
# yarn global add forever eslint neovim https://github.com/khuongduybui/sqs-copy.git env-cmd

# asdf plugin add rust
# asdf install rust latest
# asdf global rust $(asdf latest rust)
# cargo install starship bat exa git-delta zoxide

asdf plugin add python
asdf install python latest
asdf global python $(asdf latest python)
pip install --upgrade pip
pip install aws-sso-util cfn-lint cloudformation-cli cloudformation-cli-python-plugin awslogs git-remote-codecommit

asdf reshim

echo '=== Goodbye ==='
