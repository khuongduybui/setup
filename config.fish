## Global
set -xg PATH $PATH ~/bin

## Editors
set -xg EDITOR (which nvim 2>/dev/null; or which vim)
set -xg VISUAL $EDITOR
#set -xg VIEWER "$EDITOR -R"

## DOCKER
set -xg DOCKER_HOST "unix:///var/run/docker.sock"

## Languages
set -xg LANG en_US.UTF-8

## Colors
#set -g fish_color_cwd red
#set -g fish_color_user blue
#set -g fish_color_host magenta
#set -g fish_color_status red
#set -g -x fish_greeting ''
set -g theme_date_format '+%Y-%m-%d %H:%M:%S %Z'
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
test -f /etc/redhat-release; and set -g theme_color_scheme solarized; or set -g theme_color_scheme terminal2-dark-white

## Plugins
#fisher 2>/dev/null

## Windows?
if test -d /mnt/c/Users; and which powershell.exe >/dev/null
	powershell.exe -ExecutionPolicy Unrestricted -File "C:\Users\duybui\setup\WindowsPowerShell\Scripts\x-init.ps1" >/dev/null
	set -xg DISPLAY "localhost:0"
end

## Greetings
#which screenfetch >/dev/null 2>&1; and sudo screenfetch
cat ~/setup/banner.md

## Abbreviations
source ~/setup/abbreviations.fish
# test -f /etc/brazilcli.env; and bass source /etc/brazilcli.env

## Load byobu
status --is-login; and status --is-interactive; and exec byobu-launcher -S ~/byobu new-session -A -s default; or true

