function bb --argument sync
	set interface (cat Config | grep "interfaces" | grep --color=never -oe "[0-9\.]*")
	set package (cat Config | grep -oe "package\.[^ ]*" | sed "s/package.//")
	if test -n "$sync"
		brazil ws sync --md
	end
	/apollo/bin/env -e envImprovement brazil-recursive-cmd --package $package-$interface -- "brazil-build"
end
