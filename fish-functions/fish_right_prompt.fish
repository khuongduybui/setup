function fish_right_prompt
	set -l last_status $status

	if test $last_status -ne 0
		if not set -q __fish_prompt_status
			set -g __fish_prompt_status (set_color $fish_color_status)
		end
		echo -n "$__fish_prompt_status [$last_status]$__fish_prompt_normal";
	end

	set_color $fish_color_quote
	echo -n (__fish_git_prompt)" "

	set_color normal
	echo -n "["(date "+%H:%M:%S")"]"
end
