# Defined in /tmp/fish.wWD1Ky/apll.fish @ line 1
function apll
	if test (count $argv) = 1
    ripcli rip -r $argv[1] -s internalprefixlists -a custom_properties | sed "s/internal_prefix_lists : //" | jq
  else
    echo "Usage: apll <region> ('iad' and 'us-east-1' both acceptable)"
  end
end
