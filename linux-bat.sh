#! /usr/bin/env sh

rm -f ~/bin/bat
if which brew; then
  brew install bat
else
  cd $(mktemp -d)
  curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r ".assets[] | select(.name | test(\"x86_64-unknown-linux-musl.tar.gz\")) | .browser_download_url" | xargs wget -q -O ./bat.tar.gz
  tar -xzf ./bat.tar.gz
  rm -rf ~/opt/bat
  mv bat-*-x86_64-unknown-linux-musl ~/opt/bat
  ln -s ~/opt/bat/bat ~/bin/bat
  rm -f ~/.config/fish/completions/bat.fish
  mkdir -p ~/.config/fish/completions
  mv ~/opt/bat/autocomplete/bat.fish ~/.config/fish/completions/bat.fish
fi
