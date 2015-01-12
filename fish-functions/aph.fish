function aph
	if not test -x /apollo/bin/apolloHostControl
		set_color $fish_color_error; echo "ERROR: Apollo not found."
		return
	end		
	sudo /apollo/bin/apolloHostControl -e (pwe) $argv
end
