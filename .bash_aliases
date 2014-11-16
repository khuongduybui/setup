#Global
##Env var
export EDITOR=vim
alias e=vim
alias reload='. ~/.bash_aliases';
alias settings='e ~/.bash_aliases;reload';
##Functions
alias backup='which btrfs && (sudo mount /dev/sda1 /mnt;sudo btrfs subvolume snapshot /mnt/@ /mnt/@_`date +"%Y%m%d%H%M%S"`;sudo umount /mnt) || (echo "This feature requires btrfs.")'

#Development
##Generic
alias code='cd ~/code;cd';
alias g='git status';
alias gdf='git diff';
alias gco='git checkout';
alias gbd='git branch -d';
alias gbD='git branch -D';

##OpenFISMA

##Sniper
