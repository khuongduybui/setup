#Global
##Env var
export EDITOR=vi
test -d $HOME/bin && export PATH="$PATH:$HOME/bin/"
alias e=vi
alias reload='. ~/.bash_aliases';
alias settings='e ~/.bash_aliases;reload';
alias l='ls -lahF';
(which sw_vers > /dev/null 2>&1 && alias ls='ls -G') || alias ls='ls --color';

##Functions
alias backup='which btrfs > /dev/null 2>&1 && (sudo mount /dev/sda1 /mnt;sudo btrfs subvolume snapshot /mnt/@ /mnt/@_$(date +"%Y%m%d%H%M%S");sudo umount /mnt) || (echo "This feature requires btrfs.")'
function acc() {
  test -f ~/OneDrive/Essentials/accounts.ini && grep -e $1 ~/OneDrive/Essentials/accounts.ini
}

#Development
##Generic
function code() {
  if ! [ -d ~/code ]; then
    echo "ERROR: ~/code directory not found.";
    return;
  fi

  cd ~/code;
 
  if ! [ -d ./$1 ]; then
    echo "ERROR: ~/code/$1 directory not found.";
    return;
  fi

  cd ./$1;

  test -d src && test -d src/$(ls --color=none src) && cd src/$(ls --color=none src);
  test -d ./.git && git status || l;
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
alias svm='ssh -Y duybui-vm.aka.amazon.com';
function mvm() {
  test -d /home/duybui && sudo mount -t nfs -o proto=tcp,port=2049 duybui-vm.aka.amazon.com:/workplace/duybui /home/duybui/code;
  test -d /home/duybui && sudo mount -t nfs -o proto=tcp,port=2049 duybui-vm.aka.amazon.com:/apollo /apollo;
  test -d /Users/duybui && sudo mount -t nfs duybui-vm.aka.amazon.com:/rhel5pdi/workplace/duybui /workplace/duybui;
  test -d /Users/duybui && sudo mount -t nfs duybui-vm.aka.amazon.com:/rhel5pdi/apollo /apollo;
}
function aps() {
  if ! [ -d /apollo ]; then
    echo "ERROR: /apollo not found."
    return;
  fi;
  NEWPATH="$PATH";
  test -d /apollo/env/SDETools/bin && NEWPATH="/apollo/env/SDETools/bin:$NEWPATH";
  test -d /apollo/env/envImprovement/bin && NEWPATH="/apollo/env/envImprovement/bin:$NEWPATH";
  PATH="/apollo/env/SDETools/bin:$PATH" bash -i;
}

alias pwe='basename $(pwd)';
alias ape='/apollo/bin/env -e $(pwe)';
alias apa='sudo /apollo/bin/runCommand -e $(pwe) -a Activate';
alias apd='sudo /apollo/bin/runCommand -e $(pwe) -a Deactivate';

function log() {
  if ! [ -d /apollo/env/$1/var/output/logs ]; then
    echo "ERROR: log directory not found.";
    return;
  fi

  test -f /apollo/env/$1/var/output/logs/$2 || ls -lahF /apollo/env/$1/var/output/logs/;
  test -f /apollo/env/$1/var/output/logs/$2 && less /apollo/env/$1/var/output/logs/$2;
}
alias pwl='log $(pwe)';

alias activate='sudo /apollo/bin/apolloHostControl --status Active';
alias server='ape brazil-build server';
alias pkg='ape brazil-build apollo-pkg';
function pwmysql() {
  e=$(pwe);
  pMaterial=$(grep -e '<root source="odin"' apollo-overrides/$e/mysql-config/server.xml | tr '< >' '\n' | grep materialset | sed -e 's/materialset="//' -e 's/"//' -);

  pw=$(odin $pMaterial)
  db=$(grep -e '<database name=' apollo-overrides/$e/mysql-config/server.xml | tr '< >' '\n' | grep name | sed -e 's/name="//' -e 's/"//' -);

  ape mysql -S /apollo/env/$(pwe)/var/mysql/state/mysql.sock -u root -p$pw $db
}

function odin() {
  GET "http://localhost:2009/query?Operation=retrieve&ContentType=JSON&material.materialName=$1&material.materialType=Credential" | tr '{},' '\n\n\n' | sed -n 's/"materialData":"\(.*\)"/\1/p' | base64 -di
}

function railsconsole() {
  e=$(pwe);
  cd rails-root;
  /apollo/bin/env -e $e brazil-runtime-exec rails console;
  cd -;
}

function railsrunner() {
  e=$(pwe);
  cd rails-root;
  /apollo/bin/env -e $e brazil-runtime-exec rails runner ../$1;
  cd -;
}

###Durin
function mdl() {
  echo "\\\\$1\\durin_logs"
  sudo mount -t cifs "\\\\$1\\durin_logs" . -o username=ANT\\duybui,noexec
}

###EoS
####Nessus
function nlogin() {
  if ! [ -z "$TOKEN" ]; then
    echo "Already logged in with token $TOKEN";
    return;
  fi

  echo "Logging in...";
  RESULT=$(curl -k1 -d username="duybui" -d password="Aw5%3D141592" "https://$(hostname -f):8834/session" 2>/dev/null);
  TOKEN=$(node -p "var obj=$RESULT; obj.token");

  export TOKEN;
  echo "Success with token $TOKEN";
}

function nlogout() {
  if [ -z "$TOKEN" ]; then
    echo "Already logged out.";
    return;
  fi

  echo "Logging out...";
  curl -k1 -X DELETE -H "X-Cookie: token=$TOKEN" "https://$(hostname -f):8834/session" >/dev/null 2>&1;
  export TOKEN=;
  echo "Success";
}

function nget() {
  nlogin >/dev/null;
  curl -k1 -H "X-Cookie: token=$TOKEN" "https://$(hostname -f):8834/$1" 2>/dev/null;
}

export ncurl='curl -k1 -X POST -H "X-Cookie: token=$TOKEN" https://$(hostname -f):8834/';


##OpenFISMA

##Sniper

#Init
test -f ~/.git.sh && . ~/.git.sh
test -f ~/.git.sh && PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;202m\]\$prompt_status\[\e[38;5;245m\]\u\[\e[00m\]@\[\e[38;5;5m\]\h\[\e[00m\]:\[\e[38;5;172m\]\w\[\033[33;34m\]\$(__git_ps1)\[\e[00m\]\$ "
test -f ~/.git.sh && which brazil > /dev/null 2>&1 && PS1="${debian_chroot:+($debian_chroot)}\[\e[38;5;202m\]\$prompt_status\[\e[38;5;245m\]\u\[\e[00m\]@\[\e[38;5;5m\]\h\[\e[00m\]:\[\e[38;5;172m\]\w\[\033[33;34m\]\$(__git_ps1)\[\e[00m\] brazil> " && code
_byobu_sourced=1 test -f /usr/bin/byobu-launch && . /usr/bin/byobu-launch

