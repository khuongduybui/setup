function bps
    set -lx BARK_ACCOUNT
    set -lx BARK_MS
    set -lx BARK_REGION iad

    getopts $argv | while read -l key value
        switch $key
            case account
                set -x BARK_ACCOUNT $value
            case material-set
                set -x BARK_MS $value
            case region
                set -x BARK_REGION $value
            case profile
                set -x BARK_PROFILE $value
                if not test -f ~/.config/bark/profiles/$value
                    echo Profile $value not found under ~/.config/bark/profiles
                    return -1
                end
        end
    end

    if test -n "$BARK_PROFILE"
        abbr bark 'bark -cf=$HOME/.config/bark/profiles/'$BARK_PROFILE
    else
        abbr bark 'bark -a='$BARK_ACCOUNT' -ms='$BARK_MS' -ep=https://timber-corp-'$BARK_REGION'.'$BARK_REGION'.proxy.amazon.com'
    end

    if __is_mac
        /usr/local/bin/fish
    else if __is_dev_desktop
        /apollo/env/envImprovement/bin/fish
    else
        /usr/bin/fish
    end

    abbr -e bark
end
