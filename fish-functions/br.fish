# Defined in /tmp/fish.lkk8sA/br.fish @ line 2
function br
	brazil-build; and test -f bin/runtime.sh; and bash bin/runtime.sh
end
