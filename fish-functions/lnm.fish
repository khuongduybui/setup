# Defined in /tmp/fish.aqoXz8/lnm.fish @ line 2
function lnm
	which $argv[1] >/dev/null; and echo "$argv[1] is now available at (which $argv[1])"; and return

	echo -n "#!" > ~/bin/$argv[1]
	echo (which fish) >> ~/bin/$argv[1]
	echo -n "ssh um-cli /apollo/bin/env -e envImprovement /apollo/bin/env -e AmazonAwsCli /apollo/bin/env -e ApolloCommandLine $argv[1] " >> ~/bin/$argv[1]
	echo '$argv' >> ~/bin/$argv[1]

	test -f ~/bin/$argv[1]; and chmod +x ~/bin/$argv[1]
	test -x ~/bin/$argv[1]; and echo $argv[1] is now available at (which $argv[1])
end
