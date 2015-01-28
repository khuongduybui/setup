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
	cd ~/code
	if not test (count $argv) = 0
		if not test -d ./$argv[1]
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
		else
			cd $argv[1]
			if test -d ./src
				cd src
				if test -d ./(command ls)
					cd (command ls)
				end
			end
		end	
	end
	if test -d ./.git
		git status
	else
		l
	end
end