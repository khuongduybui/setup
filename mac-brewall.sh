#! /bin/bash

brew update; brew upgrade; brew cleanup
updated=`brew cask outdated --quiet`
if [ $updated ]; then brew cask reinstall $updated; fi
echo "Done. HomeBrew content is up to date."
