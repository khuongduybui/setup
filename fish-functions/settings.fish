function settings
	if test (count $argv) = 0
		edit ~/.config/fish/config.fish
		reload
	else
		if test -f ~/.config/fish/functions/$argv[1].fish
			edit ~/.config/fish/functions/$argv[1].fish
		else
			funced -e "vim -c 'set syntax=fish'" $argv
		end
		funcsave $argv
	end
end
