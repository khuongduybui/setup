# Defined in /tmp/fish.wT202P/brazil-ws.fish @ line 2
function brazil-ws
	cd ~/code
	brazil ws create --name=$argv[1]
	cd $argv[1]
	brazil setup platform-support
	mkdir -p ~/env/$argv[1]
	ln -s ~/env/$argv[1] env
	mkdir -p ~/build/$argv[1]
	ln -s ~/build/$argv[1] build
end
