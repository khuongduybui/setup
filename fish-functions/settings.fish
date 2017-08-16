# Defined in /tmp/fish.z3Jn77/settings.fish @ line 2
function settings
	if test (count $argv) = 0
		edit ~/setup/config.fish
		reload
	else
		funced -e "vim -c 'set filetype=fish'" $argv
		funcsave $argv
	end
end
