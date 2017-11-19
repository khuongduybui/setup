# Defined in /tmp/fish.k6HxjZ/bb.fish @ line 2
function bb --argument sync
	set interface (cat Config | grep "interfaces" | grep --color=never -oe "[0-9\.]*")
	set package (cat Config | grep -oe "package\.[^ ]*" | sed "s/package.//")
	if test -n "$sync"
		brazil ws sync --md
	end
	echo Building target: $package-$interface with (which brazil-build)
	echo brazil-recursive-cmd --package $package-$interface -- (which brazil-build)
	brazil-recursive-cmd --package $package-$interface -- (which brazil-build)
end
