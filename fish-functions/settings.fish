function settings
	if test (count $argv) = 0
		edit ~/.config/fish/config.fish
		reload
	else
		funced -e "vim -c 'set syntax=fish'" $argv
		funcsave $argv
	end
end
