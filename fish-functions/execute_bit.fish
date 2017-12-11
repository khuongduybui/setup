# Defined in /tmp/fish.jJ9kIA/execute_bit.fish @ line 1
function execute_bit
	set_color -o $fish_color_user
	echo -n (basename (pwd))
	set_color normal
	set_color $fish_color_quote
	echo -n (__fish_git_prompt)
	set_color normal
	echo -n '> git '
	set_color -o $fish_color_host
	echo -n $argv
	set_color normal
	echo
	git $argv
	echo
end
