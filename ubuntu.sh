#! /bin/bash

# sudo apt-add-repository -y ppa:fish-shell/release-3

if ! which brew; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash -
else
  brew update
fi
test -f /home/linuxbrew/.linuxbrew/bin/brew && echo "/home/linuxbrew/.linuxbrew/bin/brew shellenv | source; or true" >~/.config/fish/conf.d/brew.fish && /home/linuxbrew/.linuxbrew/bin/brew shellenv >/tmp/brew.sh && source /tmp/brew.sh
bash ~/setup/debian.sh
