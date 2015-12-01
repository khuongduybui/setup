#! /bin/bash
echo "Setting up global preferences..."
test -d /etc/profile.d && \
  echo 'export MESA_EXTENSION_OVERRIDE="-GL_EXT_texture_sRGB_decode -GL_ARB_draw_elements_base_vertex -GL_ARB_map_buffer_range"' >> /etc/profile.d/LoLFix.sh && \
  echo 'export NSS_SSL_CBC_RANDOM_IV=0' >> /etc/profile.d/PidginSipeFix.sh

which git && \
  git config --global user.name "Duy K. Bui" && \
  git config --global user.email "duy@buifamily.info" && \
  git config --global color.ui true && \
  git config --global push.default simple

# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /home/duybui/.git.zsh
# #curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash >> /home/duybui/.git.sh
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh > /home/duybui/.git-completion.zsh

# test -f /home/duybui/.zsh_aliases && mv /home/duybui/.zsh_aliases /home/duybui/.zsh_aliases.bak
# ln -s /home/duybui/setup/.zsh_aliases /home/duybui/
# test -f /home/duybui/.zshrc || (echo "autoload -Uz zsh-newuser-install" > /home/duybui/.zshrc; echo "zsh-newuser-install" >> /home/duybui/.zshrc)
# (test -f /home/duybui/.zshrc && grep .zsh_aliases /home/duybui/.zshrc > /dev/null 2>&1) || echo "source /home/duybui/.zsh_aliases" >> /home/duybui/.zshrc
# test -f /home/duybui/.bash_aliases && mv /home/duybui/.bash_aliases /home/duybui/.bash_aliases.bak
# ln -s /home/duybui/setup/.bash_aliases /home/duybui/
test -d /home/duybui/.config/fish || mkdir -p /home/duybui/.config/fish
test -f /home/duybui/.config/fish/config.fish || ln -s /home/duybui/setup/config.fish /home/duybui/.config/fish/
test -d /home/duybui/setup/fish-functions || ln -s /home/duybui/setup/fish-functions /home/duybui/.config/fish/functions

test -f /home/duybui/.vimrc && mv /home/duybui/.vimrc /home/duybui/.vimrc.bak
ln -s /home/duybui/setup/.vimrc /home/duybui/
test -d /home/duybui/.vim/bundle || mkdir -p /home/duybui/.vim/bundle
test -d /home/duybui/.vim/bundle/vundle || git clone https://github.com/gmarik/Vundle.vim.git /home/duybui/.vim/bundle/vundle

test -d /home/duybui/bin || mkdir /home/duybui/bin

test -f /etc/issue &&\
  grep -Ei "elementary|ubuntu" /etc/issue &&\
  echo "Ubuntu detected. Installing core modules..." &&\
  bash /home/duybui/setup/ubuntu.sh > /dev/null

#which sw_vers &&\
#  echo "OS X detected. Installing core modules..." &&\
#  sh /home/duybui/setup/mac.sh > /dev/null
echo "a"
test -f /etc/redhat-release &&\
  grep -i "Red Hat Enterprise Linux" /etc/redhat-release &&\
  echo "RHEL detected. Installing core modules..." &&\
  bash /home/duybui/setup/rhel.sh
echo "b"
chmod +x bin/*.sh

which gsettings && gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

test -d /home/duybui/code || mkdir /home/duybui/code
test -d /home/duybui/code/test || mkdir /home/duybui/code/test

echo "Installing NPM tools..."
npm install -g mocha express-generator nodemon > /dev/null

echo "Installing virtualenv..."
pip install virtualenv nodeenv

reload
echo 'Core modules have been installed.'
echo '=== Additional modules ==='
ls bin/*.sh
echo '=== Goodbye ==='
