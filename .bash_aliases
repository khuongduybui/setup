#Global
##Env var
export EDITOR=vi
alias e=vi
alias reload='. ~/.bash_aliases';
alias settings='e ~/.bash_aliases;reload';
alias l='ls -lahF';
which sw_vers > /dev/null && alias ls='ls -G';

##Functions
alias backup='which btrfs > /dev/null && (sudo mount /dev/sda1 /mnt;sudo btrfs subvolume snapshot /mnt/@ /mnt/@_`date +"%Y%m%d%H%M%S"`;sudo umount /mnt) || (echo "This feature requires btrfs.")'
function acc() {
  test -f ~/OneDrive/Essentials/accounts.ini && grep -e $1 ~/OneDrive/Essentials/accounts.ini
}

#Development
##Generic
function code() {
  test -d ~/code || return;
  cd ~/code;
 
  test -d ./$1 || return;
  cd ./$1;

  test -d src && test -d src/`ls src` && cd src/`ls src`;
  test -d ./.git && git status || ls -lahF;
}
alias g='git status';
alias gdf='git diff -b';
alias gco='git checkout';
alias gb='git branch';
alias gbd='git branch -d';
alias gbD='git branch -D';

##Amazon
alias vm='ssh -fY duybui-vm.aka.amazon.com "gnome-terminal" 2> /dev/null';
alias gvm='ssh -fY duybui-vm.aka.amazon.com gnome-panel 2> /dev/null';
alias svm='ssh -Y duybui-vm.aka.amazon.com bash -i';
function mvm() {
  test -d /home/duybui && sudo mount -t nfs -o proto=tcp,port=2049 duybui-vm.aka.amazon.com:/workplace/duybui /home/duybui/code;
  test -d /home/duybui && sudo mount -t nfs -o proto=tcp,port=2049 duybui-vm.aka.amazon.com:/apollo /apollo;
  test -d /Users/duybui && sudo mount -t nfs duybui-vm.aka.amazon.com:/rhel5pdi/workplace/duybui /workplace/duybui;
  test -d /Users/duybui && sudo mount -t nfs duybui-vm.aka.amazon.com:/rhel5pdi/apollo /apollo;
  export PATH=/apollo/env/SDETools/bin:$PATH;
}
alias aps='test -d /apollo && PATH="/apollo/env/SDETools/bin:$PATH" bash -i || echo "ERR: apollo not found"';
function log() {
  test -d /apollo/env/$1/logs || return;
  test -f /apollo/env/$1/logs/$2.log || ls -lahF /apollo/env/$1/logs/*.log;
  test -f /apollo/env/$1/logs/$2.log && less /apollo/env/$1/logs/$2.log;
}
###Durin
#alias mdl='sudo mount -t cifs \\\\iad11-va-lm1-2a.ant.amazon.com\\durin_logs . -o username=ANT\\duybui,noexec';

function mdl() {
  echo "\\\\$1\\durin_logs"
  sudo mount -t cifs "\\\\$1\\durin_logs" . -o username=ANT\\duybui,noexec
}

##OpenFISMA

##Sniper

#Init
test -f ~/.git.sh && . ~/.git.sh && PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;202m\]\$prompt_status\[\e[38;5;245m\]\u\[\e[00m\]@\[\e[38;5;5m\]\h\[\e[00m\]:\[\e[38;5;172m\]\w\[\033[33;34m\]\$(__git_ps1)\[\e[00m\]\$ "
which brazil > /dev/null && PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;202m\]\$prompt_status\[\e[38;5;245m\]\u\[\e[00m\]@\[\e[38;5;5m\]\h\[\e[00m\]:\[\e[38;5;172m\]\w\[\033[33;34m\]\$(__git_ps1)\[\e[00m\] brazil> " && code
_byobu_sourced=1 test -f /usr/bin/byobu-launch && . /usr/bin/byobu-launch
