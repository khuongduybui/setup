#! /bin/bash

if ! which brew; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash -
else
  brew update
fi
test -f /home/linuxbrew/.linuxbrew/bin/brew && echo "/home/linuxbrew/.linuxbrew/bin/brew shellenv | source; or true" >~/.config/fish/conf.d/brew.fish && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
bash ~/setup/debian.sh
