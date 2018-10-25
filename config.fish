## Plugins
source ~/setup/fallback.fish

## Completions
complete -c c2c -x -a '(__fish_complete_c2c)'
complete -c bps -l profile -x -a '(__fish_complete_bps_profile)'

if test -z $INIT
    ## Global  
    ### PATH
    set_color $fish_color_operator; echo Calculating PATH; set_color normal
    test -d ~/bin; and set -x PATH ~/bin $PATH
    test -d ~/.yarn/bin; and set -x PATH ~/.yarn/bin $PATH
    test -d ~/.local/bin; and set -x PATH ~/.local/bin $PATH
    test -x ~/.rbenv/bin/rbenv; and set -x PATH ~/.rbenv/bin $PATH
    test -d ~/.rbenv/plugins/ruby-build/bin; and set -x PATH ~/.rbenv/plugins/ruby-build/bin $PATH
    which rbenv >/dev/null 2>&1; and source (rbenv init - | psub)
    varclear PATH
    echo $PATH
    set -x HOME ~

    ### Editors
    set_color $fish_color_operator; echo Searching for Editors; set_color normal
    which dbus-launch >/dev/null 2>&1; and bass (dbus-launch --auto-syntax)
    if which subl >/dev/null 2>&1
        set -x EDITOR (which subl) -nw
    else if which io.elementary.code >/dev/null 2>&1
        set -x EDITOR (which io.elementary.code)
    else
        set -x EDITOR (which micro 2>/dev/null; or which nvim 2>/dev/null; or which vim 2>/dev/null; or which vi 2>/dev/null; or which nano 2>/dev/null)
        set -x MICRO_TRUECOLOR 1
    end
    echo $EDITOR

    ### DOCKER
    set -x DOCKER_HOST "unix:///var/run/docker.sock"

    ### Languages
    set -x LANG en_US.UTF-8

    ### Colors
    set -x theme_date_format '+%Y-%m-%d %H:%M:%S %Z'
    set -x theme_powerline_fonts yes
    set -x theme_nerd_fonts yes
    set -x theme_color_scheme solarized-light
    __is_dev_desktop; and set -x theme_display_hostname no
    __is_dev_desktop; and set -x theme_display_user no

    ### Abbreviations
    source ~/setup/abbreviations.fish

    ### Windows?
    if __is_win
        if test -f ~/.wuser
            set -x WUSER (cat ~/.wuser)
        else
            set -x WUSER (whoami)
        end

        if test -f ~/.wdrive
            set -x WDRIVE (cat ~/.wdrive)
        else
            set -x WDRIVE c
        end

        set -x WHOME /mnt/$WDRIVE/Users/$WUSER
        set -x W $WHOME
        set -x DISPLAY :0
        set -x LIBGL_ALWAYS_INDIRECT 1
        set -x NO_AT_BRIDGE 1

        test (umask) -eq 0022; or umask 0022

        mount-workdocs
        x-init
        font-init
    end

    set -x INIT true

    ## Load byobu
    if status --is-login; and status --is-interactive
        set_color $fish_color_operator; echo Launching Byobu; set_color normal
        which byobu >/dev/null 2>&1; and exec byobu-launcher -S ~/byobu new-session -A -s default; or true
    end
end
