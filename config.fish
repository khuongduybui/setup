#Plugins
if test -f /usr/local/Cellar/autojump/*/etc/autojump.fish
	source /usr/local/Cellar/autojump/*/etc/autojump.fish
end

if test (which byobu-launcher) > /dev/null 2>&1
end

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

##Abbreviations
set -g fish_user_abbreviations $fish_user_abbreviations
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
status --is-login; and status --is-interactive; and exec byobu-launcher