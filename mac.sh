function install_brew() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  brew doctor;
  brew install caskroom/cask/brew-cask;
  brew cask doctor;
}

which brew >/dev/null 2>&1 && brew update || install_brew

brew install \
  node \
  byobu \
  fish \

mkdir -p ~/.byobu
echo "set -g default-shell /usr/local/bin/fish" > ~/.byobu/.tmux.conf
echo "set -g default-command /usr/local/bin/fish" >> ~/.byobu/.tmux.conf

echo '#! /bin/sh' > ~/bin/install-chrome.sh
echo 'brew cask install google-chrome' >> ~/bin/install-chrome.sh

echo '#! /bin/sh' > ~/bin/install-skype.sh
echo 'brew cask install skype' >> ~/bin/install-skype.sh

echo '#! /bin/sh' > ~/bin/install-teamviewer.sh
echo 'brew cask install teamviewer' >> ~/bin/install-teamviewer.sh

echo '#! /bin/sh' > ~/bin/install-viber.sh
echo 'brew cask install viber' >> ~/bin/install-viber.sh
