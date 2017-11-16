# Defined in /tmp/fish.u6br7l/aps.fish @ line 2
function aps
	if test -d /apollo/env/envImprovement
		# set -lx PATH /apollo/env/SDETools/bin $PATH
		# set -lx BRAZIL_PLATFORM_OVERRIDE RHEL5_64
		# set -lx BIT_SCRIPTS_PATH $HOME/opt/BitScripts
		# set -lx PATH $PATH $BIT_SCRIPTS_PATH/bin
		# set -lx BIT_CURL (/apollo/bin/env -e envImprovement which kcurl)
		if test -d $HOME/opt/BitScripts
			bass source $HOME/opt/BitScripts/envsetup.sh
		end
		set -lx BIT_LOVES_PYTHON yes
		set -lx BIT_REVIEWER_GROUPS asis-dev
		if not test (count $argv) = 0
			if set -q BRAZIL_CLI_BIN
				/apollo/bin/env -e AmazonAwsCli /apollo/bin/env -e envImprovement /apollo/bin/env -e WDETools /apollo/bin/env -e BrazilCLI /usr/bin/fish
				return
			end
		end
		/apollo/bin/env -e AmazonAwsCli /apollo/bin/env -e envImprovement /apollo/bin/env -e WDETools /apollo/bin/env -e SDETools /usr/bin/fish
	else if test -d ~/.toolbox
		set -lx BRAZIL_CLI_BIN ~/.toolbox/bin
		set -lx PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /home/duybui/bin $BRAZIL_CLI_BIN
		/usr/bin/fish
	end
end
