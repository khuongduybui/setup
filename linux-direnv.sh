#! /bin/bash

if which brew; then
  brew install direnv
else
  # From https://direnv.net/docs/installation.html
  curl -sfL https://direnv.net/install.sh | bash
fi
