# Defined in /tmp/fish.tAi93h/__is_win.fish @ line 2
function __is_win
	grep -q -i "Microsoft" /proc/version
end
