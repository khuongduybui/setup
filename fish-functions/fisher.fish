function fisher --description 'fish plugin manager'
	switch "$FISH_VERSION"
        case 2.1.2 2.1.1 2.1.0 2.0.0
            __fisher_log error "You need fish &2.2.0& or higher to use fisherman."

            if command -s brew > /dev/null
                __fisher_log info "Run &brew up; brew upgrade --HEAD fish&"
            else
                __fisher_log info "
                    Refer to your package manager documentation for
                    instructions on how to upgrade your fish build.
                "
            end

            return 1
    end

    set -g fisher_version "2.11.0"
    set -g fisher_spinners ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏
    set -g __fisher_stdout /dev/stdout
    set -g __fisher_stderr /dev/stderr

    function __fisher_show_spinner
        if not set -q __fisher_fg_spinner[1]
            set -g __fisher_fg_spinner $fisher_spinners
        end

        printf "  $__fisher_fg_spinner[1]\r" > /dev/stderr

        set -e __fisher_fg_spinner[1]
    end

    set -l config_home $XDG_CONFIG_HOME
    set -l cache_home $XDG_CACHE_HOME

    if test -z "$config_home"
        set config_home ~/.config
    end

    if test -z "$cache_home"
        set cache_home ~/.cache
    end

    if test -z "$fish_config"
        set -g fish_config "$config_home/fish"
    end

    if test -z "$fisher_config"
        set -g fisher_config "$config_home/fisherman"
    end

    if test -z "$fisher_cache"
        set -g fisher_cache "$cache_home/fisherman"
    end

    if test -z "$fish_path"
        set -g fish_path "$fish_config"
    end

    if test -z "$fisher_file"
        set -g fisher_file "$fish_path/fishfile"
    end

    switch "$argv[1]"
        case --complete
            __fisher_complete
            return

        case -v --version
            __fisher_version
            return

        case -h
            __fisher_usage > /dev/stderr
            return
    end

    command mkdir -p {"$fish_path","$fish_config"}/{conf.d,functions,completions} "$fisher_config" "$fisher_cache"
    or return 1

    set -l completions "$fish_config/completions/$fisher_cmd_name.fish"

    if test ! -e "$completions"
        echo "$fisher_cmd_name --complete" > "$completions"
        __fisher_complete
    end

    for i in -q --quiet
        if set -l index (builtin contains --index -- $i $argv)
            set -e argv[$index]
            set __fisher_stdout /dev/null
            set __fisher_stderr /dev/null
            break
        end
    end

    set -l cmd

    switch "$argv[1]"
        case i install
            set -e argv[1]

            if test -z "$argv"
                set cmd "default"
            else
                set cmd "install"
            end

        case u up update
            set -e argv[1]
            set cmd "update"

        case r rm remove uninstall
            set -e argv[1]
            set cmd "rm"

        case l ls list
            set -e argv[1]
            set cmd "ls"

        case info ls-remote
            set -e argv[1]
            set cmd "ls-remote"

        case h help
            set -e argv[1]
            __fisher_help $argv
            return

        case --help
            set -e argv[1]
            __fisher_help
            return

        case -- ""
            set -e argv[1]

            if test -z "$argv"
                set cmd "default"
            else
                set cmd "install"
            end

        case self-{uninstall,destroy}
            set -e argv[1]
            __fisher_self_uninstall $argv
            return

        case -\*\?
            printf "$fisher_cmd_name: '%s' is not a valid option\n" "$argv[1]" > /dev/stderr
            __fisher_usage > /dev/stderr
            return 1

        case \*
            set cmd "install"
    end

    set -l elapsed (__fisher_get_epoch_in_ms)
    set -l items (
        if test ! -z "$argv"
            printf "%s\n" $argv | __fisher_read_bundle_file
        end
    )

    if test -z "$items" -a "$cmd" = "default"
        if isatty
            command touch "$fisher_file"

            set cmd "install"
            set items (__fisher_read_bundle_file < "$fisher_file")

            if test -z "$items"
                __fisher_log info "
                    No plugins to install or dependencies missing.
                " > /dev/stderr

                __fisher_log info "
                    See &$fisher_cmd_name help& for usage instructions.
                " > /dev/stderr
                return
            end
        else
            set cmd "install"
        end
    end

    switch "$cmd"
        case install update
            if not command -s git > /dev/null
                __fisher_log error "
                    git is required to download plugin repositories.
                " > /dev/stderr

                __fisher_log info "
                    Please install git and try again.
                    Visit <&https://git-scm.com&> for more information.
                " > /dev/stderr

                return 1
            end

        case ls ls-remote
            if not command -s curl > /dev/null
                __fisher_log error "
                    curl is required to query the GitHub API.
                " > /dev/stderr

                __fisher_log info "
                    Please install curl and try again.
                    Refer to your package manager documentation for instructions.
                " > /dev/stderr

                return 1
            end
    end

    switch "$cmd"
        case install
            if __fisher_install $items
                __fisher_log info "Done in &"(__fisher_get_epoch_in_ms $elapsed | __fisher_humanize_duration)"&" "$__fisher_stderr"
            end

        case update
            if isatty
                if test -z "$items"
                    set items (__fisher_list | command sed 's/^[@* ]*//')

                    if not __fisher_self_update
                        if test -z "$items"
                            __fisher_log info "Use your package manager to update fisherman."
                            return 1
                        end
                    end
                end
            else
                __fisher_parse_column_output | __fisher_read_bundle_file | read -laz _items
                set items $items $_items
            end

            __fisher_update $items

            __fisher_log info "Done in &"(__fisher_get_epoch_in_ms $elapsed | __fisher_humanize_duration)"&" "$__fisher_stderr"

        case ls
            if test "$argv" -ge 0 -o "$argv" = -
                if isatty stdout
                    __fisher_list | column -c$argv
                else
                    __fisher_list | sed 's|^[@* ]*||'
                end

            else
                __fisher_list_plugin_directory $argv
            end

        case ls-remote
            set -l format

            if test ! -z "$argv"
                switch "$argv[1]"
                    case --format\*
                        set format (printf "%s\n" "$argv[1]" | command sed 's|^--[^= ]*[= ]\(.*\)|\1|')
                        set -e argv[1]
                end

                if test -z "$format"
                    set format "%info\n%url\n"
                end
            end

            if test -z "$format"
                set format "%name\n"

                if isatty stdout
                    __fisher_list_remote "$format" $argv | column
                else
                    __fisher_list_remote "$format" $argv
                end
            else
                __fisher_list_remote "$format" $argv
            end

        case rm
            if test -z "$items"
                __fisher_parse_column_output | __fisher_read_bundle_file | read -az items
            end

            for i in $items
                set -l name (__fisher_plugin_get_names $i)[1]

                if test ! -d "$fisher_config/$name"
                    set -e items

                    if test -L "$fisher_config/$name"
                        set -l real_path (command readlink "$fisher_config/$name")

                        __fisher_log error "
                            I can't remove &$name& without its real path.
                        " "$__fisher_stderr"

                        __fisher_log info "
                            Restore &$real_path& and try again.
                        " "$__fisher_stderr"
                    else
                        __fisher_log error "Plugin &$name& is not installed." "$__fisher_stderr"
                    end

                    break
                end
            end

            if test ! -z "$items"
                __fisher_remove $items
                __fisher_log info "Done in &"(
                    __fisher_get_epoch_in_ms $elapsed | __fisher_humanize_duration)"&" "$__fisher_stderr"
            end
    end

    set -l config_glob $fisher_config/*
    set -l config (
        if test ! -z "$config_glob"
            command find $config_glob -maxdepth 0 -type d | command sed "s|.*/||"
        end
    )

    switch "$cmd"
        case ls ls-remote
        case \*
            if test -z "$config"
                echo > "$fisher_file"
                set -e fisher_dependency_count
            else
                __fisher_plugin_get_url_info -- "$fisher_config"/$config > $fisher_file
            end
    end

    complete -c $fisher_cmd_name --erase

    __fisher_complete
end
