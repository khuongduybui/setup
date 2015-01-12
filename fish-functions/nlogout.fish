function nlogout
	if test -z "$NESSUS_TOKEN"
		echo "Already logged out."
		return
	end

	echo "Logging out..."
	set host (hostname -f)
	curl -k1 -X DELETE -H "X-Cookie: token=$TOKEN" "https://$host:8834/session" >/dev/null 2>&1
	set -xg NESSUS_TOKEN
	echo "Success";
end
