# Defined in /tmp/fish.rKtbHi/__is_win_path.fish @ line 1
function __is_win_path
	string match -q "*:*" (wslpath -w $argv[1])
end
