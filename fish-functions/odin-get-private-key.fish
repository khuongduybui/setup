# Defined in /tmp/fish.NesbaD/odin-get-private-key.fish @ line 2
function odin-get-private-key
	if test (which odin-get) >/dev/null
		echo "Backing up existing file if any"
		test -f ~/.ssh/$argv[1].pem.bak; and rm ~/.ssh/$argv[1].pem.bak
		test -f ~/.ssh/$argv[1].pem; and mv ~/.ssh/$argv[1].pem ~/.ssh/$argv[1].pem.bak
		echo "Fetching $argv[1] as ~/.ssh/$argv[1].pem"
		odin-get -t PrivateKey $argv[1] | openssl pkcs8 -nocrypt -inform DER -outform PEM > ~/.ssh/$argv[1].pem
		chmod 600 ~/.ssh/$argv[1].pem
	else
		echo "odin-get not found"
		return -1
	end
end
