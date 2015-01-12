function apr
	if not test (pwe)
		set_color $fish_color_error
		echo "ERROR: cannot determine current environment."
		return
	end
	if not test -x /apollo/bin/runCommand
		set_color $fish_color_error
		echo "ERROR: Apollo not found."
		return
	end
	sudo /apollo/bin/runCommand -e (pwe) -a $argv
end
