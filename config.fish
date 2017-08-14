##Global
set -xg PATH $PATH ~/bin

##Editors
set -xg EDITOR (which nvim 2>/dev/null; or which vim)
set -xg VISUAL $EDITOR
#set -xg VIEWER "$EDITOR -R"

##DOCKER
set -xg DOCKER_HOST "unix:///var/run/docker.sock"

##Languages
set -xg LANG en_US.UTF-8

##Colors
#set -g fish_color_cwd red
#set -g fish_color_user blue
#set -g fish_color_host magenta
#set -g fish_color_status red
#set -g -x fish_greeting ''
set -g theme_color_scheme terminal2-dark-white
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

##Plugins
#fisher 2>/dev/null

##Windows?
if test -d /mnt/c/Users
	powershell.exe -ExecutionPolicy Unrestricted -File "C:\Users\duybui\setup\WindowsPowerShell\Scripts\x-init.ps1" >/dev/null
	set -xg DISPLAY "localhost:0"
end

##Greetings
#which screenfetch >/dev/null 2>&1; and sudo screenfetch
cat ~/setup/banner.md

##Abbreviations
abbr f fuck
abbr reset-fish 'rm ~/.config/fish/fishd*'
abbr reset-time 'sudo ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime'
abbr update-git 'git remote set-url origin git@bitbucket.org:khuongduybui/linux.git'
abbr byobu 'byobu-launcher -S ~/byobu new-session -A -s default'
abbr awsp 'aws --profile'
abbr ssh-corp 'ssh -o ProxyCommand=None'
abbr rebuild-coral 'clear; begin; set -lx SERVICE (pwe); cd ../"$SERVICE"Model/; brazil-build; cd ../"$SERVICE"Generator/; brazil-build; cd ../"$SERVICE"; brazil-build server; end'
abbr grep-runtime-log 'grep (brazil-bootstrap)/var/output/logs/* -e'
abbr pickaxe 'ssh -At duybui.aka.amazon.com ssh -t aws-pickaxe-iad-prod-1a-i-24be46da.us-east-1.amazon.com /apollo/env/AWSPickaxeEscritoire/bin/pickaxe'
abbr cra 'cr --all'
abbr lsenv 'l /apollo/env/'
abbr esudo 'sudo -E'
abbr pkg 'ape /apollo/end/SDETools/bin/brazil-build apollo-pkg'
abbr server 'ape /apollo/env/SDETools/bin/brazil-build server'
abbr activate 'aph --status Active'
abbr apd 'apr Deactivate'
abbr apa 'apr Activate'
abbr acc accounts
abbr a abbr
abbr d dot
abbr c code
abbr v view
abbr se sedit
abbr e edit
abbr s settings
abbr bdf 'bit diff --ignore-space-change'
abbr gdf 'git diff --ignore-space-change'
abbr gbD 'git branch -D'
abbr gbd 'git branch -d'
abbr gb 'git branch'
abbr bco 'bit checkout'
abbr gco 'git checkout'
abbr b 'bit status'
abbr g 'git status'

status --is-login; and status --is-interactive; and exec byobu-launcher -S ~/byobu new-session -A -s default
