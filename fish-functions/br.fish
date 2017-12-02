# Defined in /tmp/fish.klk4fr/br.fish @ line 2
function br
	brazil-build; and test -f bin/runtime.sh; and bash bin/runtime.sh $argv
end
