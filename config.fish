if status --is-interactive
    ## Plugins
    source ~/setup/verify-fisher.fish
    source ~/setup/fallback.fish
    source ~/setup/fish_preexec.fish

    ## Completions
    complete -c c2c -x -a '(__fish_complete_c2c)'
    complete -c ips -x -a '(__fish_complete_ips)'
    complete -c ssm-env -x -a '(__fish_complete_ssm-env)'

    ## Abbreviations
    source ~/setup/abbreviations.fish

    ## AWS
    # type -q aws-sso-util; and aws-sso-util login --all --headless &

    __is_day; and git config --global delta.syntax-theme "Monokai Extended Light"; or git config --global delta.syntax-theme "Monokai Extended"
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

        __ensure_path ~/.local/bin

        __ensure_path /home/linuxbrew/.linuxbrew/bin

        __ensure_path /snap/bin

        test -f ~/.asdf/asdf.fish; and source ~/.asdf/asdf.fish

        # if test -d /usr/local/android/sdk/tools
        #     set -xU ANDROID_HOME /usr/local/android/sdk
        #     __ensure_path $ANDROID_HOME/tools
        #     __ensure_path $ANDROID_HOME/platform-tools
        #     set -xU JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
        # end

        # __ensure_path /$WROOT/z/Microsoft\ VS\ Code/bin
        # __ensure_path /$WROOT/c/Program\ Files/Oracle/VirtualBox

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
            if test -e ~/.asdf/shims/edit
                set -x EDITOR ~/.asdf/shims/edit
            else if type -q code
                and not test -e ~/.disable-vscode
                set -x EDITOR ~/setup/vscode.sh
            else
                set -x EDITOR (which io.elementary.code 2>/dev/null; or which micro 2>/dev/null; or which nvim 2>/dev/null; or which vim 2>/dev/null; or which vi 2>/dev/null; or which nano 2>/dev/null)
            end
            set -xU MICRO_TRUECOLOR 1
            set -xU EDITOR $EDITOR
            echo $EDITOR >~/.editor
        end

        if not test -e ~/.browser
            info 'Searching for Browsers'
            if type -q wslview
                set -x BROWSER (which wslview)
            else if type -q microsoft-edge
                set -x BROWSER (which microsoft-edge)
            else if type -q microsoft-edge-dev
                set -x BROWSER (which microsoft-edge-dev)
            end
            if test -n "$BROWSER"
                set -xU BROWSER $BROWSER
                set -xg BROWSER $BROWSER
                echo $BROWSER >~/.browser
            end
        end

        ### Languages
        if not grep -q -e "LANG=en_US.UTF-8" /etc/locale.conf
            info 'Setting locale'
            grep -q -e "^LC_ALL=en_US.UTF-8\$" /etc/environment; or echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
            grep -q -e "^en_US.UTF-8 UTF-8\$" /etc/locale.gen; or echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
            echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
            type -q locale-gen; and sudo locale-gen en_US.UTF-8
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

        ## Create /run/user/(id -u)
        sudo mkdir -p /run/user/(id -u)
        sudo chown -R (id -un):(id -gn) /run/user/(id -u)

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
            docker-init
        else
            set -x WIP 127.0.0.1
        end
        echo $WIP >~/.wip

        type -q vagrant; and set -xg VAGRANT_WSL_ENABLE_WINDOWS_ACCESS 1

        test (umask) -eq 0022; or umask 0022

        font-init
    end

    ## Preload WPS
    wps-init

    ## Done INIT
    set -x INIT true

    ## Load genie & byobu
    if status --is-login
        and status --is-interactive

        if test -z $INSIDE_GENIE
            and not test -e ~/.disable-genie
            and type -q genie
            info 'Summoning genie'
            exec genie -s
        end

        if test -z $BYOBU_WINDOW_NAME
            and not test -e ~/.byobu/disable-autolaunch
            and type -q byobu-launcher
            info 'Launching Byobu'
            exec byobu-launcher
        end
    end
end

### Shell
type -q starship; and source (starship init fish --print-full-init | psub)

type -q direnv; and direnv hook fish | source

type -q zoxide; and zoxide init fish | source; and abbr cd z
