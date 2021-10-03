#! /bin/bash

# bash ~/setup/debian.sh
echo "--- Install pengwin supported tools ---"
if ! which fish; then
  pengwin-setup install SETTINGS SHELLS FISH
fi
if ! which brew; then
  pengwin-setup install TOOLS HOMEBREW
else
  brew update
fi
if ! which pwsh; then
  pengwin-setup install TOOLS POWERSHELL
fi

echo "--- Install package manager ---"
sudo apt install -y gdebi apt-transport-https dirmngr

echo "--- Install system utils ---"
sudo apt install -y jq direnv fzf zoxide

echo "--- Install dev tools ---"
sudo apt install -y pkg-config make build-essential
sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sudo apt install -y librust-openssl-dev || sudo apt install -y libssl-dev
bash ~/setup/debian-aws-ssm.sh
