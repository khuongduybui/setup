function aps
	if test -d /apollo/env/envImprovement
		set -lx PATH /apollo/env/SDETools/bin $PATH
		set -lx BRAZIL_PLATFORM_OVERRIDE RHEL5_64
		/apollo/env/envImprovement/bin/fish
	end
end
