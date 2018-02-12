function accounts
	if test -f ~/OneDrive/Essentials/accounts.ini
		if test (count $argv) = 0
			edit ~/OneDrive/Essentials/accounts.ini
		else
			egrep --color -e $argv[1] ~/OneDrive/Essentials/accounts.ini
		end
	else if test -f /mnt/c/Users/$WSUER/OneDrive/Essentials/accounts.ini
		if test (count $argv) = 0
			edit /mnt/c/Users/$WSUER/OneDrive/Essentials/accounts.ini
		else
			egrep --color -e $argv[1] /mnt/c/Users/$WSUER/OneDrive/Essentials/accounts.ini
		end
	else if test -f /mnt/d/OneDrive/Essentials/accounts.ini
		if test (count $argv) = 0
			edit /mnt/d/OneDrive/Essentials/accounts.ini
		else
			egrep --color -e $argv[1] /mnt/d/OneDrive/Essentials/accounts.ini
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
		echo "~/OneDrive/Essentials" or "/mnt/c/Users/$WSUER/OneDrive/Essentials" or "/d/OneDrive/Essentials"
		return
	end
end
