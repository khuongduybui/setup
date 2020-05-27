if status --is-interactive
    ## Plugins
    source ~/setup/verify-fisher.fish
    source ~/setup/fallback.fish

    ## Completions
    complete -c c2c -x -a '(__fish_complete_c2c)'
    complete -c ips -x -a '(__fish_complete_ips)'
    complete -c ssm-env -x -a '(__fish_complete_ssm-env)'

    ## Abbreviations
    source ~/setup/abbreviations.fish
end

if test -z $INIT
    ## Global
    ### PATH
    if test -e ~/.path
        set -eg PATH
    else
        info 'Calculating PATH'
        __clean_missing PATH

        __ensure_path ~/bin

        __ensure_path /home/linuxbrew/.linuxbrew/bin

        __ensure_path /snap/bin

        test -f ~/.asdf/asdf.fish
        and source ~/.asdf/asdf.fish

        # __ensure_path ~/.nodenv/bin

        # test -z $NODENV_SHELL
        # and which nodenv >/dev/null 2>&1
        # and source (nodenv init - | psub)

        # __ensure_path ~/.yarn/bin

        # __ensure_path ~/.pyenv/bin

        # test -z $PYENV_SHELL
        # and which pyenv >/dev/null 2>&1
        # and source (pyenv init - | psub)
        # and source (pyenv virtualenv-init - | psub)

        # __ensure_path ~/.local/bin

        # __ensure_path ~/.rbenv/bin

        # __ensure_path ~/.rbenv/plugins/ruby-build/bin

        # test -z $RBENV_SHELL
        # and which rbenv >/dev/null 2>&1
        # and source (rbenv init - | psub)

        # test -d /usr/local/go
        # and set -x GOROOT /usr/local/go

        # test -d ~/go
        # and set -x GOPATH ~/go

        # test -n "$GOPATH"
        # and __ensure_path $GOPATH/bin

        # test -d ~/.cargo
        # and source ~/.cargo/env

        # test -d ~/.deno
        # and set -x DENO_INSTALL ~/.deno

        # test -n "$DENO_INSTALL"
        # and __ensure_path $DENO_INSTALL/bin

        # if test -d /usr/local/android/sdk/tools
        #     set -xU ANDROID_HOME /usr/local/android/sdk
        #     __ensure_path $ANDROID_HOME/tools
        #     __ensure_path $ANDROID_HOME/platform-tools
        #     set -xU JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
        # end

        # __ensure_path /z/Microsoft\ VS\ Code/bin

        varclear PATH
        __clean_missing PATH
        set -xU PATH $PATH
        set -x HOME ~

        echo $PATH >~/.path
    end

    if status --is-interactive
        ### Editors
        if not test -e ~/.editor
            info 'Searching for Editors'
            if which code >/dev/null 2>&1
                and not test -e ~/.disable-vscode
                set -x EDITOR ~/setup/vscode.sh
            else
                set -x EDITOR (which io.elementary.code 2>/dev/null; or which micro 2>/dev/null; or which nvim 2>/dev/null; or which vim 2>/dev/null; or which vi 2>/dev/null; or which nano 2>/dev/null)
            end
            set -xU MICRO_TRUECOLOR 1
            set -xU EDITOR $EDITOR
            echo $EDITOR >~/.editor
        end

        ### Languages
        if not grep -q -e "LANG=en_US.UTF-8" /etc/locale.conf
            info 'Setting locale'
            grep -q -e "^LC_ALL=en_US.UTF-8\$" /etc/environment
            or echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
            grep -q -e "^en_US.UTF-8 UTF-8\$" /etc/locale.gen
            or echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
            echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
            which locale-gen >/dev/null 2>&1
            and sudo locale-gen en_US.UTF-8
        end
    end

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

        if test -f /etc/wsl.conf
            and grep -q -e root= /etc/wsl.conf
            set -x WROOT (command grep -e root= /etc/wsl.conf | command sed s/root=// | command sed s:/\$::)
        else
            set -x WROOT /mnt
        end
        set -x WHOME (wslpath "$WDRIVE:/Users/$WUSER")
        set -x W $WHOME
        rm -f ~/winhome
        ln -s $WHOME ~/winhome

        if __is_wsl_2
            set -x WIP (ip route show default | grep -Po 'via \K\S+')
            set -x DOCKER_BUILDKIT 1
        else
            set -x WIP 127.0.0.1
        end
        echo $WIP >~/.wip
        set -x DISPLAY $WIP:0.0

        test (umask) -eq 0022
        or umask 0022

        x-init &
        font-init
    end

    ## Preload WPS
    wps-init

    ## Create /run/user/(id -u)
    sudo mkdir -p /run/user/(id -u)
    sudo chown -R (id -un):(id -gn) /run/user/(id -u)

    ## Done INIT
    set -x INIT true

    ## Load genie & byobu
    if status --is-login
        and status --is-interactive

        if test -z $INSIDE_GENIE
            and not test -e ~/.disable-genie
            and which genie >/dev/null 2>&1
            info 'Summoning genie'
            exec genie -s
        end

        if test -z $BYOBU_WINDOW_NAME
            and not test -e ~/.byobu/disable-autolaunch
            and which byobu-launcher >/dev/null 2>&1
            info 'Launching Byobu'
            exec byobu-launcher
        end
    end
end

### Shell
which starship >/dev/null 2>&1
and source (starship init fish --print-full-init | psub)

which direnv >/dev/null 2>&1
and direnv hook fish | source
