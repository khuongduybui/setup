# Defined in /tmp/fish.y98yUZ/push-ssh.fish @ line 2
function push-ssh
	rsync -e ssh -r ~/.ssh duybui.aka.amazon.com:~
    rsync -e ssh -r ~/.aws duybui.aka.amazon.com:~
end
