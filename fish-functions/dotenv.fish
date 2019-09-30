# Defined in /tmp/fish.QY9cqm/dotenv.fish @ line 1
function dotenv
	test -e .env
  and posix-source .env
end
