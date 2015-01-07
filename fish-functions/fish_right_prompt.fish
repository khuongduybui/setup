function fish_right_prompt
	set_color $fish_color_quote
	echo -n (__fish_git_prompt)" "
	set_color normal
	echo -n "["(date "+%H:%M:%S")"]"
end
