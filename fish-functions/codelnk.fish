function codelnk
	if not test -d ~/code.lnk
		set_color $fish_color_error
		echo -n "ERROR: "
		set_color normal
		set_color $fish_color_param[2]
		echo -n "code.lnk/ "
		set_color $fish_color_error
		echo -n "not found under "
		set_color normal
		set_color $fish_color_param[2]
		echo "~/"
		return
	end
	pushd .
	cd ~/code.lnk
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
			echo "~/code.lnk/"
			set_color normal
		else
			cd $argv[1]
			set -xg DEBUG "$argv[1]:*"
			if test -d ./src
				cd src
				set -gx BRAZIL_PACKAGES_DIR (pwd)
			end
				if test (count $argv) = 2
					cd ./(command ls | grep --color=none -i $argv[2])
				else if test (count (command ls)) = 1
					cd (command ls)
				end
		end	
	end
	if test -d ./.git
		git status
	else
		l
	end
	if test -f ./env/bin/activate.fish
		. ./env/bin/activate.fish
	end
end