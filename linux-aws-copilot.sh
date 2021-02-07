#! /bin/sh

sudo curl -Lo ~/bin/copilot https://github.com/aws/copilot-cli/releases/latest/download/copilot-linux
sudo chmod +x ~/bin/copilot
copilot --help
