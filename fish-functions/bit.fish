# Defined in /tmp/fish.Pjr423/bit.fish @ line 2
function bit
	for repo in (ls */.git | grep .git: | sed -e 's|/\.git:||')
		cd $repo
		
		set_color -o $fish_color_user
		echo -n $repo
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

		cd -
		echo
	end
end
