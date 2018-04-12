# Defined in /tmp/fish.MOfPnQ/aps.fish @ line 2
function aps
	set -lx ADDITIONAL_PATH $PATH
	test -d /apollo/env/envImprovement; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/envImprovement/bin
	test -d /apollo/env/AmazonAwsCli; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/AmazonAwsCli/bin
	test -d /apollo/env/BarkCLI; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/BarkCLI/bin
	test -d /apollo/env/OdinTools; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/OdinTools/bin
	test -d /apollo/env/OctaneBrazilTools; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/OctaneBrazilTools/bin
	test -d /apollo/env/ApolloCommandLine; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/ApolloCommandLine/bin
	test -d /apollo/env/QuiltCLI; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/QuiltCLI/bin
	test -d /apollo/env/NodeJS; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/NodeJS/bin
	test -d /apollo/env/Sigv4Curl; and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/Sigv4Curl/bin

	if not test (count $argv) = 0
		test set -q BRAZIL_CLI_BIN; or set -lx BRAZIL_CLI_BIN ~/.toolbox/bin
		set -lx PATH $ADDITIONAL_PATH $BRAZIL_CLI_BIN
	else
		set -lx PATH $ADDITIONAL_PATH /apollo/env/SDETools/bin
	end

	/usr/bin/fish
end
