# Defined in /tmp/fish.Z2LtwY/ips.fish @ line 2
function ips
    set -lx AWS_PROFILE (cat ~/.aws/config | grep profile | sed -e 's/\[profile //' -e 's/\]//' | fzf -1 -q $argv[1])
    if __is_mac
        /usr/local/bin/fish
    else
        /usr/bin/fish
    end
end
