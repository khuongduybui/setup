## Plugins
source ~/setup/fallback.fish

## Completions
complete -c c2c -x -a '(__fish_complete_c2c)'
complete -c ips -x -a '(__fish_complete_ips)'
complete -c bps -l profile -x -a '(__fish_complete_bps_profile)'

if test -z $INIT
    ## Global
    ### PATH
    set_color $fish_color_operator; echo Calculating PATH; set_color normal
    __missing_path ~/bin; and set -x PATH ~/bin $PATH
    __missing_path ~/.nodenv/bin; and set -x PATH ~/.nodenv/bin $PATH
    test -z $NODENV_SHELL; and which nodenv >/dev/null 2>&1; and source (nodenv init - | psub)
    __missing_path ~/.yarn/bin; and set -x PATH ~/.yarn/bin $PATH
    __missing_path ~/.pyenv/bin; and set -x PATH ~/.pyenv/bin $PATH
    test -z $PYENV_SHELL; which pyenv >/dev/null 2>&1; and source (pyenv init - | psub); and source (pyenv virtualenv-init - | psub)
    __missing_path ~/.local/bin; and set -x PATH ~/.local/bin $PATH
    __missing_path ~/.rbenv/bin; and set -x PATH ~/.rbenv/bin $PATH
    __missing_path ~/.rbenv/plugins/ruby-build/bin; and set -x PATH ~/.rbenv/plugins/ruby-build/bin $PATH
    test -z $RBENV_SHELL; which rbenv >/dev/null 2>&1; and source (rbenv init - | psub)
    test -d /usr/local/go; and set -x GOROOT /usr/local/go;
    test -n "$GOROOT"; and __missing_path $GOROOT/bin; and set -x PATH $GOROOT/bin $PATH
    test -d ~/go; and set -x GOPATH ~/go
    test -n "$GOPATH"; and __missing_path $GOPATH/bin; and set -x PATH $GOPATH/bin $PATH
    varclear PATH
    # echo $PATH
    set -x HOME ~

    ### Editors
    set_color $fish_color_operator; echo Searching for Editors; set_color normal
    if not __is_dev_desktop; and not test -e ~/.disable-dbus
        which dbus-launch >/dev/null 2>&1; and test -f ~/.config/fish/functions/bass.fish; and bass (dbus-launch --auto-syntax)
    end
    if which code >/dev/null 2>&1; and not test -e ~/.disable-vscode
        set -x EDITOR '"'(which code)'"'
    else if __is_win; and test -e (wslpath "C:\Program Files\Microsoft VS Code\Code.exe"); and not test -e ~/.disable-vscode
        set -x EDITOR '"'(wslpath 'C:\Program Files\Microsoft VS Code\Code.exe')'"'
    else if which subl >/dev/null 2>&1; and not test -e ~/.disable-sublime; and not test -e ~/.disable-dbus
        set -x EDITOR (which subl)' -nw'
    else
        set -x EDITOR (which io.elementary.code 2>/dev/null; or which micro 2>/dev/null; or which nvim 2>/dev/null; or which vim 2>/dev/null; or which vi 2>/dev/null; or which nano 2>/dev/null)
        set -x MICRO_TRUECOLOR 1
    end
    echo $EDITOR

    ### DOCKER bridge
    if test -x /usr/bin/docker-relay
        sudo /usr/bin/docker-relay
        set -x DOCKER_HOST "unix:///var/run/docker.sock"
    end

    ### Languages
    grep -q -e "^LC_ALL=en_US.UTF-8\$" /etc/environment; or echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
    grep -q -e "^en_US.UTF-8 UTF-8\$" /etc/locale.gen; or echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
    echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
    which locale-gen > /dev/null 2>&1; and sudo locale-gen en_US.UTF-8

    ### Colors
    set_color $fish_color_operator; echo Setting color theme; set_color normal
    set -x theme_date_format '+%Y-%m-%d %H:%M:%S %Z'
    set -x theme_powerline_fonts yes
    set -x theme_nerd_fonts yes
    # __is_night; and set -x theme_color_scheme solarized-dark; or set -x theme_color_scheme solarized-light
    set -x theme_color_scheme terminal2-dark-white
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

        if test -f /etc/wsl.conf; and grep -q -e root= /etc/wsl.conf
            set -x WROOT (command grep -e root= /etc/wsl.conf | command sed s/root=// | command sed s:/\$::)
        else
            set -x WROOT /mnt
        end
        set -x WHOME (wslpath "$WDRIVE:/Users/$WUSER")
        set -x W $WHOME
        set -x DISPLAY :0
        set -x LIBGL_ALWAYS_INDIRECT 1
        set -x NO_AT_BRIDGE 1

        # if status --is-login; and status --is-interactive; and test -f $W/setup/win-utils/ColorTool.exe
        #     # __is_night; and eval $W/setup/win-utils/ColorTool.exe -x solarized_dark; or eval $W/setup/win-utils/ColorTool.exe -x solarized_light
        #     eval $W/setup/win-utils/ColorTool.exe -x BirdsOfParadise
        # end

        test (umask) -eq 0022; or umask 0022

        # mount-workdocs
        x-init
        font-init
    end

    ### Amazon
    if test -z $REQUESTS_CA_BUNDLE
        test -e /etc/ssl/certs/ca-certificates.crt; and set -x REQUESTS_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt
        test -e /etc/ssl/certs/ca-bundle.crt; and set -x REQUESTS_CA_BUNDLE /etc/ssl/certs/ca-bundle.crt
        echo $REQUESTS_CA_BUNDLE
    end

    set -x INIT true

    ## Preload WPS
    wps-init

    ## Load byobu
    if status --is-login; and status --is-interactive; and which byobu-launcher >/dev/null 2>&1
        set_color $fish_color_operator; echo Launching Byobu; set_color normal
        if test -e ~/.byobu/disable-autolaunch
            echo Suppress byobu due to the presence of ~/.byobu/disable-autolaunch
        else
            exec byobu-launcher
        end
    end
end
