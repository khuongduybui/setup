# Defined in /tmp/fish.t77qRE/accounts.fish @ line 2
function accounts
    set -l location
    test -f ~/OneDrive/Essentials/accounts.ini; and set location ~/OneDrive/Essentials/accounts.ini
    test -f $WHOME/OneDrive/Essentials/accounts.ini; and set location $WHOME/OneDrive/Essentials/accounts.ini
    wslpath 'D:/OneDrive/Essentials/accounts.ini' >/dev/null 2>&1; and set location (wslpath 'D:/OneDrive/Essentials/accounts.ini')
    wslpath 'W:/My\ Documents/Essentials/accounts.ini' >/dev/null 2>&1; and set location (wslpath 'W:/My\ Documents/Essentials/accounts.ini' 2>/dev/null)

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
        echo "$WDRIVE:/Users/$WUSER/OneDrive/Essentials"
        echo "D:/OneDrive/Essentials"
        echo "W:/My Documents/OneDrive/Essentials"
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
