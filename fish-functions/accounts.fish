# Defined in /var/folders/dz/y2q7pw153pz7gm62rj5n25_9qzr_wy/T//fish.unCYdU/accounts.fish @ line 2
function accounts
	if test -f ~/OneDrive/Essentials/accounts.ini
        if test (count $argv) = 0
            edit ~/OneDrive/Essentials/accounts.ini
        else
            egrep --color -i -e $argv[1] ~/OneDrive/Essentials/accounts.ini
        end
    else if test -f $WHOME/OneDrive/Essentials/accounts.ini
        if test (count $argv) = 0
            edit $WHOME/OneDrive/Essentials/accounts.ini
        else
            egrep --color -i -e $argv[1] $WHOME/OneDrive/Essentials/accounts.ini
        end
    else if test -f $WROOT/d/OneDrive/Essentials/accounts.ini
        if test (count $argv) = 0
            edit $WROOT/d/OneDrive/Essentials/accounts.ini
        else
            egrep --color -i -e $argv[1] $WROOT/d/OneDrive/Essentials/accounts.ini
        end
    else if test -f $WROOT/w/My\ Documents/Essentials/accounts.ini
        if test (count $argv) = 0
            edit $WROOT/w/My\ Documents/Essentials/accounts.ini
        else
            egrep --color -i -e $argv[1] $WROOT/w/My\ Documents/Essentials/accounts.ini
        end
    else
        set_color $fish_color_error
        echo -n "ERROR: "
        set_color normal
        set_color $fish_color_param[1]
        echo -n "accounts.ini "
        set_color $fish_color_error
        echo -n "not found under "
        set_color normal
        # set_color $fish_color_param[2]
        echo "~/OneDrive/Essentials" or "$WHOME/OneDrive/Essentials" or "$WROOT/d/OneDrive/Essentials" or "$WROOT/w/My Documents/OneDrive/Essentials"
        return
    end
end
