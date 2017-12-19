# Defined in /tmp/fish.0eXgZR/chime.fish @ line 2
function chime
	curl -X POST $argv[1] -H "Content-Type:application/json" --data "{\"Content\":\"$argv[2..-1]\"}"
end
