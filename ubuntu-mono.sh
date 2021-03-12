#! /usr/bin/env sh

sudo apt update -y
sudo apt install -y apt-transport-https gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update -y
sudo apt install -y mono-devel

cd $(mktemp -d)
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo gdebi -n packages-microsoft-prod.deb
sudo apt update -y
sudo apt install -y dotnet-sdk-5.0
