# Defined in /tmp/fish.hvtgAh/pwe.fish @ line 2
function pwe
	pwd | egrep -o "/src/[^/]+" | cut -f 3 -d "/" - | head -1
end
