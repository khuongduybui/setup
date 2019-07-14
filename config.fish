## Plugins
source ~/setup/fallback.fish

## Completions
complete -c c2c -x -a '(__fish_complete_c2c)'
complete -c ips -x -a '(__fish_complete_ips)'

if test -z $INIT
    ## Global
    ### PATH
    set_color $fish_color_operator; echo Calculating PATH; set_color normal
    __missing_path ~/bin; and set -x PATH ~/bin $PATH
    __missing_path /home/linuxbrew/.linuxbrew/bin; and set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
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
    __clean_missing PATH
    # echo $PATH
    set -x HOME ~

    ### Editors
    set_color $fish_color_operator; echo Searching for Editors; set_color normal
    if which code >/dev/null 2>&1; and not test -e ~/.disable-vscode
        set -x EDITOR ~/setup/vscode.sh
    else
        set -x EDITOR (which io.elementary.code 2>/dev/null; or which micro 2>/dev/null; or which nvim 2>/dev/null; or which vim 2>/dev/null; or which vi 2>/dev/null; or which nano 2>/dev/null)
        set -x MICRO_TRUECOLOR 1
    end
    echo $EDITOR

    # ### DOCKER bridge
    # if which docker >/dev/null 2>&1; and test -e ~/winhome/.npiperelay/npiperelay.exe
    #     set_color $fish_color_operator; echo Launching Docker relay; set_color normal
    #     bash -c 'sudo /usr/bin/docker-relay "$PATH"'
    #     # set -x DOCKER_HOST "unix:///var/run/docker.sock"
    #     ps aux | grep -q 'socat UNIX-LISTEN:/var/run/docker.sock'; and echo "Done"
    # end

    ### Languages
    set_color $fish_color_operator; echo Setting locale; set_color normal
    grep -q -e "^LC_ALL=en_US.UTF-8\$" /etc/environment; or echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
    grep -q -e "^en_US.UTF-8 UTF-8\$" /etc/locale.gen; or echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
    echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
    which locale-gen > /dev/null 2>&1; and sudo locale-gen en_US.UTF-8

    ### Colors
    set_color $fish_color_operator; echo Setting color theme; set_color normal
    set -x theme_date_format '+%Y-%m-%d %H:%M:%S %Z'
    set -x theme_powerline_fonts yes
    set -x theme_nerd_fonts yes
    set -x theme_color_scheme terminal2-dark-white

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
        rm -f ~/winhome
        ln -s $WHOME ~/winhome

        if __is_wsl_2
            set -x WIP (grep -e 'nameserver' /etc/resolv.conf | sed 's/nameserver //')
        else
            set -x WIP 127.0.0.1
        end
        echo $WIP > ~/.wip
        set -x DISPLAY $WIP:0.0

        test (umask) -eq 0022; or umask 0022

        x-init
        font-init
    end

    ## Preload WPS
    wps-init

    ## Done INIT
    set -x INIT true

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
