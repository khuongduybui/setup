## Global
test -d ~/bin; and set -xg PATH ~/bin $PATH
test -d ~/.yarn/bin; and set -xg PATH ~/.yarn/bin $PATH
test -d ~/.local/bin; and set -xg PATH ~/.local/bin $PATH
test -d ~/.rbenv/bin; and set -xg PATH ~/.rbenv/bin $PATH
test -d ~/.rbenv/shims; and set -xg PATH ~/.rbenv/shims $PATH
test -d ~/.gem/ruby/2.5.0/bin; and set -xg PATH ~/.gem/ruby/2.5.0/bin $PATH
varclear PATH
set -xg HOME ~

## Editors
set -xg EDITOR (which micro; or which nvim; or which vim; or which vi; or which nano)

## DOCKER
set -xg DOCKER_HOST "unix:///var/run/docker.sock"

## Languages
set -xg LANG en_US.UTF-8

## Colors
set -g theme_date_format '+%Y-%m-%d %H:%M:%S %Z'
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
__is_dev_desktop; and set -g theme_display_hostname no
__is_dev_desktop; and set -g theme_display_user no
set -g theme_color_scheme terminal2-dark-white

## Plugins
#fisher 2>/dev/null
source ~/setup/fallback.fish

## Windows?
if __is_win
    if test -f ~/.wuser
        set -xg WUSER (cat ~/.wuser)
    else
        set -xg WUSER (whoami)
    end

    if test -f ~/.wdrive
        set -xg WDRIVE (cat ~/.wdrive)
    else
        set -xg WDRIVE c
    end

    set -xg WHOME /mnt/$WDRIVE/Users/$WUSER
    set -xg W $WHOME
    set -xg DISPLAY :0
    set -xg LIBGL_ALWAYS_INDIRECT 1
    set -xg NO_AT_BRIDGE 1

    test (umask) -eq 0022; or umask 0022

    mount-workdocs
end

## Greetings
#which screenfetch >/dev/null 2>&1; and sudo screenfetch
cat ~/setup/banner.md

## Abbreviations
source ~/setup/abbreviations.fish
# test -f /etc/brazilcli.env; and bass source /etc/brazilcli.env

## Completions
complete -c code -x -a '(__fish_complete_code)'
complete -c bps -l profile -x -a '(__fish_complete_bps_profile)'

## Load byobu
if status --is-login; and status --is-interactive
    which byobu >/dev/null 2>&1; and exec byobu-launcher -S ~/byobu new-session -A -s default; or true
    if which abduco >/dev/null 2>&1
        set -x DVTM_TERM xterm
        abduco | grep duybui; and exec abduco -a duybui; or exec abduco -c duybui 
    end
end
