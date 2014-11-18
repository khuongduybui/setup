#! /bin/sh
echo "Setting up global preferences..."
echo 'export MESA_EXTENSION_OVERRIDE="-GL_EXT_texture_sRGB_decode -GL_ARB_draw_elements_base_vertex -GL_ARB_map_buffer_range"' >> /etc/profile.d/LoLFix.sh

git config --global user.name "Duy K. Bui"
git config --global user.email "duy@buifamily.info"
git config --global color.ui true

test -f ~/.bash_aliases && mv ~/.bash_aliases ~/.bash_aliases.bak
ln -s ~/setup/.bash_aliases ~/

test -d ~/bin || mkdir ~/bin

wget -O - https://deb.nodesource.com/setup | sudo bash - > /dev/null

test -f /etc/issue &&\
  grep -i ubuntu /etc/issue &&\
  echo "Ubuntu detected. Installing core modules..." &&\
  sh ~/setup/ubuntu.sh > /dev/null

chmod +x bin/*.sh

test -d ~/code || mkdir ~/code
test -d ~/code/test || mkdir ~/code/test

echo "Installing NPM tools..."
npm install -g mocha express-generator nodemon > /dev/null

echo ''
echo '=== Additional modules ==='
echo 'To install Skype, run install-skype.sh'
echo 'To install Viber, run install-viber.sh'
echo 'To install TeamViewer, run install-teamviewer.sh'
echo 'To install PlayOnLinux and Steam, run install-game.sh'
echo '=== Goodbye ==='
