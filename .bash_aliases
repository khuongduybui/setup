#Global
##Env var
test -d /apollo && \
  export PATH="/apollo/env/SDETools/bin:$PATH"
export EDITOR=vi
alias e=vi
alias reload='. ~/.bash_aliases';
alias settings='e ~/.bash_aliases;reload';
##Functions
alias backup='which btrfs && (sudo mount /dev/sda1 /mnt;sudo btrfs subvolume snapshot /mnt/@ /mnt/@_`date +"%Y%m%d%H%M%S"`;sudo umount /mnt) || (echo "This feature requires btrfs.")'

#Development
##Generic
alias code='cd ~/code;test -d src && cd src;cd';
alias g='git status';
alias gdf='git diff -b';
alias gco='git checkout';
alias gbd='git branch -d';
alias gbD='git branch -D';

##Amazon
alias vm='ssh -fY duybui-vm.aka.amazon.com gnome-panel 2> /dev/null';

##OpenFISMA

##Sniper

#Init
test -f ~/.git.sh && . ~/.git.sh && PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;202m\]\$prompt_status\[\e[38;5;245m\]\u\[\e[00m\]@\[\e[38;5;5m\]\h\[\e[00m\]:\[\e[38;5;172m\]\w\[\033[33;34m\]\$(__git_ps1)\[\e[00m\]\$ "
_byobu_sourced=1 test -f /usr/bin/byobu-launch && . /usr/bin/byobu-launch
