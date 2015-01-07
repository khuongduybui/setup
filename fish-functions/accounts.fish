function accounts
	if not test -f ~/OneDrive/Essentials/accounts.ini
		set_color $fish_color_error
		echo -n "ERROR: "
		set_color normal
		set_color $fish_color_param[1]
		echo -n "accounts.ini"
		set_color $fish_color_error
		echo -n "not found under "
		set_color normal
		set_color $fish_color_param[2]
		echo "~/OneDrive/Essentials"
		return
	end
	if test (count $argv) = 0
		edit ~/OneDrive/Essentials/accounts.ini
	else
		egrep --color -e $argv[1] ~/OneDrive/Essentials/accounts.ini
	end
end
