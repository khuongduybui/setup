function code
	if not test -d ~/code
		set_color $fish_color_error
		echo -n "ERROR: "
		set_color normal
		set_color $fish_color_param[2]
		echo -n "code/ "
		set_color $fish_color_error
		echo -n "not found under "
		set_color normal
		set_color $fish_color_param[2]
		echo "~/"
		return
	end
	pushd .
	if test (count $argv) = 0
		cd ~/code
		ls
	else
		cd ~/code
		if not test -d ~/code/$argv[1]
			set_color $fish_color_error
			echo -n "ERROR: "
			set_color normal
			set_color $fish_color_param[2]
			echo -n "$argv[1]/ "
			set_color $fish_color_error
			echo -n "not found under "
			set_color normal
			set_color $fish_color_param[2]
			echo "~/code/"
			set_color normal
			ls
		else
			cd $argv[1]
		end	
	end
end
