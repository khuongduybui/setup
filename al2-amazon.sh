#! /bin/bash

# Latest GIT
test -f ~/.gitignore.bak && rm ~/.gitignore.bak
test -f ~/.gitignore && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/setup/amazon.gitignore ~/.gitignore
test -f ~/.gitconfig.bak && rm ~/.gitconfig.bak
test -f ~/.gitconfig && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/setup/amazon.gitconfig ~/.gitconfig
