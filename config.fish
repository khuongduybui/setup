#Global
set -xg PATH $PATH ~/bin

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

##Greetings
cat ~/setup/banner.md

##Abbreviations
set -g fish_user_abbreviations 'g=git status' $fish_user_abbreviations
set -g fish_user_abbreviations 'gco=git checkout' $fish_user_abbreviations
set -g fish_user_abbreviations 'gb=git branch' $fish_user_abbreviations
set -g fish_user_abbreviations 'gbd=git branch -d' $fish_user_abbreviations
set -g fish_user_abbreviations 'gbD=git branch -D' $fish_user_abbreviations
set -g fish_user_abbreviations 'gdf=git diff --ignore-space-change' $fish_user_abbreviations
set -g fish_user_abbreviations 's=settings' $fish_user_abbreviations
set -g fish_user_abbreviations 'e=edit' $fish_user_abbreviations
set -g fish_user_abbreviations 'se=sedit' $fish_user_abbreviations
set -g fish_user_abbreviations 'v=view' $fish_user_abbreviations
set -g fish_user_abbreviations 'c=code' $fish_user_abbreviations
set -g fish_user_abbreviations 'd=dot' $fish_user_abbreviations
set -g fish_user_abbreviations 'a=abbr' $fish_user_abbreviations
set -g fish_user_abbreviations 'acc=accounts' $fish_user_abbreviations
set -g fish_user_abbreviations 'apa=apr Activate' $fish_user_abbreviations
set -g fish_user_abbreviations 'apd=apr Deactivate' $fish_user_abbreviations
set -g fish_user_abbreviations 'activate=aph --status Active' $fish_user_abbreviations
set -g fish_user_abbreviations 'server=ape /apollo/env/SDETools/bin/brazil-build server' $fish_user_abbreviations
set -g fish_user_abbreviations 'pkg=ape /apollo/end/SDETools/bin/brazil-build apollo-pkg' $fish_user_abbreviations
set -g fish_user_abbreviations 'esudo=sudo -E' $fish_user_abbreviations
set -g fish_user_abbreviations 'eossh=ssh -i .ssh/id_eos_ec2 -l ec2-user' $fish_user_abbreviations
set -g fish_user_abbreviations 'lsenv=l /apollo/env/' $fish_user_abbreviations
set -g fish_user_abbreviations $fish_user_abbreviations
set -g fish_user_abbreviations 'pickaxe=ssh -At duybui-um.aka.amazon.com ssh -t aws-pickaxe-iad-prod-1a-i-24be46da.us-east-1.amazon.com /apollo/env/AWSPickaxeEscritoire/bin/pickaxe' $fish_user_abbreviations
set -g fish_user_abbreviations 'grep-runtime-log=grep (brazil-bootstrap)/var/output/logs/* -e' $fish_user_abbreviations
set -g fish_user_abbreviations 'rebuild-coral=clear; begin; set -lx SERVICE (pwe); cd ../"$SERVICE"Model/; brazil-build; cd ../"$SERVICE"Generator/; brazil-build; cd ../"$SERVICE"; brazil-build server; end' $fish_user_abbreviations

