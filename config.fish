#Global
##Editors
set -xg EDITOR (which vim)
set -xg VISUAL $EDITOR
set -xg VIEWER "$EDITOR -v"

##Languages
set -xg LANG en_US.UTF-8

##Colors
set -g fish_color_cwd red
set -g fish_color_user blue
set -g fish_color_host magenta
set -g fish_color_status red
set -g -x fish_greeting ''

##Abbreviations
alias 'g=git status'
alias 'gco=git checkout'
alias 'gb=git branch'
alias 'gbd=git branch -d'
alias 'gbD=git branch -D'
alias 'gdf=git diff --ignore-space-change'
alias 's=settings'
alias 'e=edit'
alias 'se=sedit'
alias 'v=view'
alias 'c=code'
alias 'd=dot'
alias 'a=abbr'
alias 'acc=accounts'
alias 'apa=apr Activate'
alias 'apd=apr Deactivate'
alias 'activate=aph --status Active'
alias 'server=ape /apollo/env/SDETools/bin/brazil-build server'
alias 'pkg=ape /apollo/end/SDETools/bin/brazil-build apollo-pkg'
alias 'esudo=sudo -E'
alias 'eossh=ssh -i .ssh/id_eos_ec2 -l ec2-user'
alias 'lsenv=l /apollo/env/'
alias 'pickaxe=ssh -At duybui-um.aka.amazon.com ssh -t aws-pickaxe-iad-prod-1a-i-24be46da.us-east-1.amazon.com /apollo/env/AWSPickaxeEscritoire/bin/pickaxe'
alias 'grep-runtime-log=grep (brazil-bootstrap)/var/output/logs/* -e'
alias 'rebuild-coral=clear; begin; set -lx SERVICE (pwe); cd ../"$SERVICE"Model/; brazil-build; cd ../"$SERVICE"Generator/; brazil-build; cd ../"$SERVICE"; brazil-build server; end'
status --is-login; and status --is-interactive; and exec byobu-launcher

