## Global
test -d ~/bin; and set -xg PATH ~/bin $PATH
test -d ~/.yarn/bin; and set -xg PATH ~/.yarn/bin $PATH
test -d ~/.local/bin; and set -xg PATH ~/.local/bin $PATH
test -x ~/.rbenv/bin/rbenv; and set -xg PATH ~/.rbenv/bin $PATH
test -d ~/.rbenv/plugins/ruby-build/bin; and set -xg PATH ~/.rbenv/plugins/ruby-build/bin $PATH
which rbenv >/dev/null 2>&1; and source (rbenv init - | psub)
varclear PATH
set -xg HOME ~

## Editors
which dbus-launch >/dev/null 2>&1; and bass (dbus-launch --auto-syntax)
if which subl >/dev/null 2>&1
    set -xg EDITOR 'subl -nw'
else if which io.elementary.code >/dev/null 2>&1
    set -xg EDITOR io.elementary.code
else
    set -xg EDITOR (which micro 2>/dev/null; or which nvim 2>/dev/null; or which vim 2>/dev/null; or which vi 2>/dev/null; or which nano 2>/dev/null)
    set -xg MICRO_TRUECOLOR 1
end

## DOCKER
set -xg DOCKER_HOST "unix:///var/run/docker.sock"

## Languages
set -xg LANG en_US.UTF-8

## Colors
set -g theme_date_format '+%Y-%m-%d %H:%M:%S %Z'
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_color_scheme solarized-light
__is_dev_desktop; and set -g theme_display_hostname no
__is_dev_desktop; and set -g theme_display_user no
# set -g theme_color_scheme terminal2-dark-white

## Plugins
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

## Abbreviations
source ~/setup/abbreviations.fish
# test -f /etc/brazilcli.env; and bass source /etc/brazilcli.env

## Completions
complete -c code -x -a '(__fish_complete_code)'
complete -c bps -l profile -x -a '(__fish_complete_bps_profile)'

## Load byobu
if status --is-login; and status --is-interactive
    which byobu >/dev/null 2>&1; and exec byobu-launcher -S ~/byobu new-session -A -s default; or true
end
