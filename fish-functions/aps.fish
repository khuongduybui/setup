function aps
	if test -d /apollo/env/envImprovement
		# set -lx PATH /apollo/env/SDETools/bin $PATH
		# set -lx BRAZIL_PLATFORM_OVERRIDE RHEL5_64
		/apollo/bin/env -e envImprovement /apollo/bin/env -e WDETools /apollo/bin/env -e BarkCLI /apollo/bin/env -e SDETools fish
	end
end
