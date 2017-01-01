function aps
	if test -d /apollo/env/envImprovement
		# set -lx PATH /apollo/env/SDETools/bin $PATH
		# set -lx BRAZIL_PLATFORM_OVERRIDE RHEL5_64
		set -lx PATH $PATH $HOME/opt/BitScripts/bin
		set -lx BIT_CURL (/apollo/bin/env -e envImprovement which kcurl)
		set -lx BIT_LOVES_PYTHON yes
		set -lx BIT_REVIEWER_GROUPS aws-security-tanc
#		if set -q BRAZIL_CLI_BIN
#			/apollo/bin/env -e envImprovement /apollo/bin/env -e WDETools /apollo/bin/env -e BrazilCLI /usr/bin/fish
#		else
			/apollo/bin/env -e envImprovement /apollo/bin/env -e WDETools /apollo/bin/env -e SDETools /usr/bin/fish
#		end
	end
end
