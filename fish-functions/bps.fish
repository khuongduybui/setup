# Defined in /tmp/fish.ZkeYx1/bps.fish @ line 2
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
        end
    end

    abbr bark 'bark -a='$BARK_ACCOUNT' -ms='$BARK_MS' -ep=https://timber-corp-'$BARK_REGION'.'$BARK_REGION'.proxy.amazon.com'
    if __is_mac
        /usr/local/bin/fish
    else
        /usr/bin/fish
    end
    abbr -e bark
end
