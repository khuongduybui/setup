function ips
	set -lx AWS_PROFILE $argv[1]
  test -e /etc/ssl/certs/ca-certificates.crt; and set -lx REQUESTS_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt
  test -e /etc/ssl/certs/ca-bundle.crt; and set -lx REQUESTS_CA_BUNDLE /etc/ssl/certs/ca-bundle.crt
	if __is_mac
		/usr/local/bin/fish
	else
		/usr/bin/fish
	end
end
