# Defined in /tmp/fish.MOfPnQ/aps.fish @ line 2
function aps
	if test -d /apollo/env/envImprovement
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
		fish
	end
end
