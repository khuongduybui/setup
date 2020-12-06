# Defined in /tmp/fish.avRCE7/accounts.fish @ line 2
function accounts
    set -l location
    echo $location
    test -f ~/OneDrive/Essentials/accounts.ini; and set location ~/OneDrive/Essentials/accounts.ini
    echo $location
    test -f ~/winhome/OneDrive/Essentials/accounts.ini; and set location ~/winhome/OneDrive/Essentials/accounts.ini
    echo $location

    if test -z "$location"
        set_color $fish_color_error
        echo -n "ERROR: "
        set_color normal
        set_color $fish_color_param[1]
        echo -n "accounts.ini "
        set_color $fish_color_error
        echo "not found in these locations:"
        set_color normal
        echo "~/OneDrive/Essentials"
        echo "~/winhome/OneDrive/Essentials"
        return -1
    end

    if test (count $argv) = 0
        edit $location
    else
        set query $argv[1]
        if grep -Ei -e $query $location | grep -q '= {'
            grep --color=none -Eizo -e "[a-z0-9 .]*"$query"[^{]+\{[^}]+}" $location
        else
            grep -Ei -e $query $location
        end
    end
end
