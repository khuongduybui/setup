# Defined in /tmp/fish.J3ZZNY/l.fish @ line 2
function l
	if __is_mac
		ls -laGhF $argv
	else
		ls -lahF --color $argv
	end
end
