function reload
	if test -f ~/.config/fish/config.fish
		. ~/.config/fish/config.fish

	else
		set_color $fish_color_error
		echo -n "ERROR: "

		set_color normal
		set_color $fish_color_param[1]
		echo -n "config.fish "

		set_color $fish_color_error
		echo -n "not found under "

		set_color normal
		set_color $fish_color_param[2]
		echo "~/.config/fish/"
	end
end
