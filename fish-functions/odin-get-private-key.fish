# Defined in /tmp/fish.GpRdMe/odin-get-private-key.fish @ line 2
function odin-get-private-key
	echo "Backing up existing file if any"
	test -f ~/.ssh/$argv[1].pem.bak; and rm ~/.ssh/$argv[1].pem.bak
	test -f ~/.ssh/$argv[1].pem; and mv ~/.ssh/$argv[1].pem ~/.ssh/$argv[1].pem.bak
	echo "Fetching $argv[1] as ~/.ssh/$argv[1].pem"
	echo "-----BEGIN RSA PRIVATE KEY-----" > ~/.ssh/$argv[1].pem
	/apollo/env/envImprovement/bin/odin-get -t PrivateKey $argv[1] | base64 >> ~/.ssh/$argv[1].pem
	echo "-----END RSA PRIVATE KEY-----" >> ~/.ssh/$argv[1].pem
	chmod 600 ~/.ssh/$argv[1].pem
end
