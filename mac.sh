#! /bin/bash

echo "Install package manager"
function install_brew() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  brew doctor;
  brew install caskroom/cask/brew-cask;
  brew cask doctor;
}
which brew >/dev/null 2>&1 && brew update || install_brew

echo "Install system utils" # @TODO vim neovim mc screenfetch
brew install \
  fish byobu \

echo "Install dev tools" # @TODO awscli & python
brew install \
  node yarn \

echo "Update system"
mkdir -p ~/.byobu

echo "set -g default-shell /usr/local/bin/fish" > ~/.byobu/.tmux.conf
echo "set -g default-command /usr/local/bin/fish" >> ~/.byobu/.tmux.conf
