#Plugins
if test -f /usr/local/Cellar/autojump/*/etc/autojump.fish
	source /usr/local/Cellar/autojump/*/etc/autojump.fish
end

#Global
##Editors
set -xg EDITOR (which vim)
##Colors
set -g fish_color_cwd red
set -g fish_color_user blue
set -g fish_color_host magenta

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
