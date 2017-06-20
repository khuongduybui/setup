#! /bin/bash
echo "Setting up global preferences..."
# test -d /etc/profile.d &&\
#   echo 'export MESA_EXTENSION_OVERRIDE="-GL_EXT_texture_sRGB_decode -GL_ARB_draw_elements_base_vertex -GL_ARB_map_buffer_range"' >> /etc/profile.d/LoLFix.sh &&\
#   echo 'export NSS_SSL_CBC_RANDOM_IV=0' >> /etc/profile.d/PidginSipeFix.sh

# which git &&\
#   git config --global user.name "Duy K. Bui" &&\
#   git config --global user.email "duy@buifamily.info" &&\
#   git config --global color.ui true &&\
#   git config --global push.default matching

# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git.sh
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash >> ~/.git.sh
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh > ~/.git-completion.zsh

# test -f ~/.zsh_aliases && mv ~/.zsh_aliases ~/.zsh_aliases.bak
# ln -s ~/setup/.zsh_aliases ~/
# test -f ~/.zshrc || (echo "autoload -Uz zsh-newuser-install" > ~/.zshrc; echo "zsh-newuser-install" >> ~/.zshrc)
# (test -f ~/.zshrc && grep .zsh_aliases ~/.zshrc > /dev/null 2>&1) || echo "source ~/.zsh_aliases" >> ~/.zshrc
# test -f ~/.bash_aliases && mv ~/.bash_aliases ~/.bash_aliases.bak
# ln -s ~/setup/.bash_aliases ~
test -d ~/.config/fish || mkdir -p ~/.config/fish
test -f ~/.config/fish/config.fish || ln -s ~/setup/config.fish ~/.config/fish/config.fish
test -f ~/.config/fish/fishfile || ln -s ~/setup/fishfile ~/.config/fish/fishfile
test -d ~/.config/fish/functions || ln -s ~/setup/fish-functions ~/.config/fish/functions

test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.`date +%Y-%m-%d`.bak
ln -s ~/setup/.vimrc ~/
test -d ~/.vim/bundle || mkdir -p ~/.vim/bundle
test -d ~/.vim/bundle/vundle || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle

test -d ~/bin || mkdir ~/bin
test -d ~/opt || mkdir ~/opt

test -f /etc/issue &&\
  grep -Ei "elementary|ubuntu" /etc/issue &&\
  echo "Ubuntu detected. Installing core modules..." &&\
#   bash ~/setup/ubuntu.sh > /dev/null
  bash ~/setup/ubuntu.sh

test -f /etc/issue && test -d /mnt/c/Users &&\
  grep -Ei "elementary|ubuntu" /etc/issue &&\
  echo "Ubuntu on Windows detected. Installing additional modules..." &&\
#   bash ~/setup/ubuntu-win.sh > /dev/null
  bash ~/setup/ubuntu-win.sh

# which sw_vers &&\
#   echo "OS X detected. Installing core modules..." &&\
# #   sh ~/setup/mac.sh > /dev/null
#   sh ~/setup/mac.sh

test -f /etc/redhat-release &&\
  grep -i "Red Hat Enterprise Linux" /etc/redhat-release &&\
  echo "RHEL detected. Installing core modules..." &&\
#   bash ~/setup/rhel.sh > /dev/null
  bash ~/setup/rhel.sh

# cd ~
# chown -R $(id -un):$(id -gn) .
# cd -

chmod +x bin/*.sh

which gsettings && gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

test -d ~/code || mkdir ~/code
test -d ~/code/test || mkdir ~/code/test

# which npm >/dev/null 2>&1 &&\
#   echo "Installing NPM tools..." &&\
#   sudo npm install -g mocha express-generator nodemon > /dev/null

# which pip >/dev/null 2>&1 &&\
#   echo "Installing virtualenv..." &&\
#   sudo pip install virtualenv nodeenv

# reload
echo 'Core modules have been installed.'

mkdir -p ~/.byobu
echo 'set -g default-shell /usr/bin/fish' > ~/.byobu/.tmux.conf
echo 'set -g default-command /usr/bin/fish' >> ~/.byobu/.tmux.conf

echo '=== Additional modules ==='
ls bin/*.sh
echo '=== Goodbye ==='
