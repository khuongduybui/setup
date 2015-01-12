function ape
	if not test (pwe)
		set_color $fish_color_error; echo "ERROR: cannot determine current environment."
		return
	end
	if not test -x /apollo/bin/env
		set_color $fish_color_error; echo "ERROR: Apollo not found."
		return
	end		
	/apollo/bin/env -e (pwe) $argv
end
