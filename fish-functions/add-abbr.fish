# Defined in /tmp/fish.5LEaOQ/add-abbr.fish @ line 1
function add-abbr
	abbr $argv
	echo abbr $argv >> ~/setup/abbreviations.fish
end
