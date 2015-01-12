function nget
	nlogin >/dev/null
	set host (hostname -f)
	curl -k1 -H "X-Cookie: token=$NESSUS_TOKEN" "https://$host:8834/$argv[1]" 2>/dev/null
end
