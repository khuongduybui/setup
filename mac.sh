# function install_brew() {
#   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
#   brew doctor;
#   brew install caskroom/cask/brew-cask;
#   brew cask doctor;
# }

# which brew && brew update || install_brew

# brew install \
#   node \
#   byobu \
#   fish \
#   autojump \

# grep "fish" /etc/shells || echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
# ln -s ~/setup/fish-functions ~/.config/fish/functions
# ln -s ~/setup/config.fish ~/.config/fish/

# #byobu-enable

# #test -f ~/.bash_aliases && \
# #test -f ~/.byobu/prompt && \
# #grep -e .bash_aliases ~/.byobu/prompt || \
# #  echo 'source ~/.bash_aliases' >> ~/.byobu/prompt

# echo '#! /bin/sh' > ~/bin/install-chrome.sh
# echo 'brew cask install google-chrome' >> ~/bin/install-chrome.sh

# echo '#! /bin/sh' > ~/bin/install-skype.sh
# echo 'brew cask install skype' >> ~/bin/install-skype.sh

# echo '#! /bin/sh' > ~/bin/install-teamviewer.sh
# echo 'brew cask install teamviewer' >> ~/bin/install-teamviewer.sh

# echo '#! /bin/sh' > ~/bin/install-viber.sh
# echo 'brew cask install viber' >> ~/bin/install-viber.sh
