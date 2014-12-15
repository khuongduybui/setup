#! /bin/sh
echo "Setting up global preferences..."
test -d /etc/profile.d && \
  echo 'export MESA_EXTENSION_OVERRIDE="-GL_EXT_texture_sRGB_decode -GL_ARB_draw_elements_base_vertex -GL_ARB_map_buffer_range"' >> /etc/profile.d/LoLFix.sh && \
  echo 'export NSS_SSL_CBC_RANDOM_IV=0' >> /etc/profile.d/PidginSipeFix.sh

which git && \
  git config --global user.name "Duy K. Bui" && \
  git config --global user.email "duy@buifamily.info" && \
  git config --global color.ui true

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git.sh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash >> ~/.git.sh

test -f ~/.bash_aliases && mv ~/.bash_aliases ~/.bash_aliases.bak
ln -s ~/setup/.bash_aliases ~/

test -d ~/bin || mkdir ~/bin

test -f /etc/issue &&\
  grep -i ubuntu /etc/issue &&\
  echo "Ubuntu detected. Installing core modules..." &&\
  sh ~/setup/ubuntu.sh > /dev/null

which sw_vers &&\
  echo "OS X detected. Installing core modules..." &&\
  sh ~/setup/mac.sh

chmod +x bin/*.sh

which gsettings && gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

test -d ~/code || mkdir ~/code
test -d ~/code/test || mkdir ~/code/test

echo "Installing NPM tools..."
npm install -g mocha express-generator nodemon > /dev/null

reload
echo 'Core modules have been installed.'
echo '=== Additional modules ==='
ls bin/*.sh
echo '=== Goodbye ==='
