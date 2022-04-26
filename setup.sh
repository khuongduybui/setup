#! /bin/bash

echo "=== Setting up global preferences ==="

mkdir -p ~/.config
bash ~/setup/backup-and-link.sh ~/setup/gtk-3.0 ~/.config/
bash ~/setup/backup-and-link.sh ~/setup/gtk-2.0/gtkrc ~/.gtkrc-2.0

mkdir -p ~/.config/fish/conf.d
bash ~/setup/backup-and-link.sh ~/setup/config.fish ~/.config/fish/conf.d/"$USER".fish
bash ~/setup/backup-and-link.sh ~/setup/fishfile ~/.config/fish/fish_plugins
bash ~/setup/backup-and-link.sh ~/setup/fish-functions ~/.config/fish/functions
if [ -f /etc/fish/conf.d/00-pengwin.fish ]; then
    cp /etc/fish/conf.d/00-pengwin.fish ~/setup/00-pengwin.fish
else
    bash ~/setup/backup-and-link.sh ~/setup/00-pengwin.fish ~/.config/fish/conf.d/00-pengwin.fish
fi

mkdir -p ~/.config/atuin
bash ~/setup/backup-and-link.sh ~/setup/atuin/config.toml ~/.config/atuin/

mkdir -p ~/.config/nu
bash ~/setup/backup-and-link.sh ~/setup/nushell/config.toml ~/.config/nu/

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
    cd ~/.vim/bundle/vundle || return
    git pull
    cd - || return
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
fi

bash ~/setup/backup-and-link.sh ~/setup/.editorconfig ~/

bash ~/setup/backup-and-link.sh ~/setup/.czrc ~/
bash ~/setup/backup-and-link.sh ~/setup/default.gitconfig ~/.gitconfig
bash ~/setup/backup-and-link.sh ~/setup/default.gitignore ~/.gitignore
mkdir -p ~/.config/gh
bash ~/setup/backup-and-link.sh ~/setup/gh/config.yml ~/.config/gh/
mkdir -p ~/.config/git
bash ~/setup/backup-and-link.sh ~/setup/default.gitattributes ~/.config/git/attributes

bash ~/setup/backup-and-link.sh ~/setup/.password-store ~/
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
bash ~/setup/backup-and-link.sh ~/setup/gpg.conf ~/.gnupg/gpg.conf

mkdir -p ~/bin
curl https://raw.githubusercontent.com/codexnull/allssh/master/allssh >~/bin/allssh
chmod +x ~/bin/allssh
if [ -f /usr/local/bin/cmd-exe ]; then
    cp /usr/local/bin/cmd-exe ~/setup/cmd-exe
else
    bash ~/setup/backup-and-link.sh ~/setup/cmd-exe ~/bin/cmd-exe
fi

bash ~/setup/backup-and-link.sh ~/setup/.allsshrc ~/

mkdir -p ~/opt
mkdir -p ~/code

if [ ! -f /.dockerenv ]; then
    echo "=== Installing modules ==="

    test -f /etc/issue &&
        grep -q -Ei "arch" /etc/issue &&
        echo "Arch Linux detected. Installing core modules..." &&
        bash ~/setup/arch.sh

    test -f /etc/issue &&
        grep -q -Ei "elementary|ubuntu|pop|zorin" /etc/issue &&
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
# if which webi >/dev/null 2>&1; then
#     webi webi
# else
#     curl -sS https://webinstall.dev/webi | bash
# fi
~/setup/linux-starship.sh # brew install starship
~/setup/linux-bat.sh      # brew install bat
~/setup/linux-exa.sh      # brew install exa
~/setup/linux-delta.sh    # brew install git-delta
~/setup/linux-nu.sh       # brew install nu

echo '=== Common development tools ==='
bash ~/setup/linux-inotify.sh
bash ~/setup/linux-micro.sh
bash ~/setup/linux-aws-cli-v2.sh
bash ~/setup/linux-aws-sam.sh
bash ~/setup/linux-aws-sam-cdk.sh

if which brew >/dev/null 2>&1; then
    brew install aws-sso-util git-remote-codecommit
else
    if test -f /home/linuxbrew/.linuxbrew/bin/brew; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        brew install aws-sso-util git-remote-codecommit
    else
        echo brew install aws-sso-util git-remote-codecommit
    fi
fi

# brew install shellcheck hadolint yamllint black cfn-lint # provided by trunk.io

if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi
# shellcheck disable=SC1090
. ~/.asdf/asdf.sh
mkdir -p ~/.config/fish/completions
cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
asdf update
asdf plugin update --all

asdf plugin add deno
asdf install deno latest
asdf global deno "$(asdf latest deno)"
bash ~/setup/shell-utils/install.sh

asdf plugin add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs latest
asdf global nodejs "$(asdf latest nodejs)"
npm install -g npm@latest yarn@latest
# yarn global add forever eslint neovim https://github.com/khuongduybui/sqs-copy.git env-cmd

asdf plugin add rust
asdf install rust latest
asdf global rust "$(asdf latest rust)"
cargo install difftastic
# cargo install starship bat exa git-delta zoxide

asdf plugin add python
asdf install python latest
asdf global python "$(asdf latest python)"
pip install --upgrade pip
pip install --upgrade pipx

asdf reshim

# pipx install cfn-lint
# pipx inject cfn-lint pydot

mkdir -p /home/duybui/.virtualenvs
pipx install virtualfish
pipx ensurepath
fish -c "vf install"
fish -c "vf addplugins auto_activation"

pipx upgrade-all
echo "=== Suggestions ==="

~/setup/suggest.sh gh "brew install gh"
which gh >/dev/null 2>/dev/null && gh extension install mislav/gh-branch
which gh >/dev/null 2>/dev/null && gh extension install redraw/gh-install
which gh >/dev/null 2>/dev/null && gh extension install gennaro-tedesco/gh-f
~/setup/suggest.sh jt "$HOME/setup/brew-gh-jira.sh"
~/setup/suggest.sh sft "$HOME/setup/debian-scaleft.sh"
~/setup/suggest.sh atuin "brew install atuin"
~/setup/suggest.sh direnv "brew install direnv"
~/setup/suggest.sh zoxide "brew install zoxide"
~/setup/suggest.sh btm "brew install bottom"
~/setup/suggest.sh bandwhich "brew install bandwhich"
~/setup/suggest.sh dust "brew install dust"
~/setup/suggest.sh procs "brew install procs"
~/setup/suggest.sh smem "apt|dnf|pacman install smem"
~/setup/suggest.sh trunk "$HOME/setup/linux-trunk.sh"
~/setup/suggest.sh difft "cargo install difftastic"
~/setup/suggest.sh sam "$HOME/setup/linux-aws-sam.sh"
~/setup/suggest.sh sam-beta-cdk "$HOME/setup/linux-aws-sam-cdk.sh"

echo '=== Goodbye ==='
