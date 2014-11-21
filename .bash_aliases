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

##OpenFISMA

##Sniper

#Init
_byobu_sourced=1 test -f /usr/bin/byobu-launch && . /usr/bin/byobu-launch
