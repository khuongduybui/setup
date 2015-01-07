function pwe
	pwd | egrep -o "/src/[^/]+" | cut -f 3 -d "/" -
end
