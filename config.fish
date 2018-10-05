## Global
mkdir -p ~/.yarn/bin
mkdir -p ~/.local/bin
set -xg PATH $PATH ~/bin ~/.yarn/bin ~/.local/bin
set -xg HOME ~

## Editors
set -xg EDITOR (which micro; or which nvim; or which vim; or which vi; or which nano)
#set -xg VISUAL $EDITOR
#set -xg VIEWER "$EDITOR -R"

## DOCKER
set -xg DOCKER_HOST "unix:///var/run/docker.sock"

## Languages
set -xg LANG en_US.UTF-8

## Colors
set -g theme_date_format '+%Y-%m-%d %H:%M:%S %Z'
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
__is_dev_desktop
and set -g theme_display_hostname no
__is_dev_desktop
and set -g theme_display_user no
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
    set -xg DISPLAY "localhost:0"

    # if which powershell.exe >/dev/null
    #     powershell.exe -ExecutionPolicy Unrestricted -File "$WDRIVE:\Users\\$WUSER\setup\WindowsPowerShell\Scripts\x-init.ps1" >/dev/null
    #     set -xg LIBGL_ALWAYS_INDIRECT 1
    #     set -xg XCURSOR_SIZE 64
    # end

    test (umask) -eq 0022
    or umask 0022

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
if status --is-login
    and status --is-interactive
    if __is_dev_desktop
        exec byobu-launcher -S ~/byobu new-session -A -s default
    else
        exec byobu-launcher
    end
end

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/duybui/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish ]
and . /home/duybui/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish
