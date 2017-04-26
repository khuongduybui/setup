function odin-get-private-key
	echo "Fetching $argv[1] as ~/.ssh/$argv[1].pem"
	rm ~/.ssh/$argv[1].pem.bak
	mv ~/.ssh/$argv[1].pem ~/.ssh/$argv[1].pem.bak
	echo "-----BEGIN RSA PRIVATE KEY-----" > ~/.ssh/$argv[1].pem
	/apollo/env/envImprovement/bin/odin-get -t PrivateKey $argv[1] | base64 >> ~/.ssh/$argv[1].pem
	echo "-----END RSA PRIVATE KEY-----" >> ~/.ssh/$argv[1].pem
	chmod 600 ~/.ssh/$argv[1].pem
end
