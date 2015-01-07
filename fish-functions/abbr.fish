function abbr
	set -g fish_user_abbreviations $argv $fish_user_abbreviations
	echo "set -g fish_user_abbreviations" "'"$argv"'" '$fish_user_abbreviations' >> ~/.config/fish/config.fish
end
