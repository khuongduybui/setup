# Defined in /tmp/fish.f5mRVw/__fish_complete_code.fish @ line 2
function __fish_complete_code
	if test -d ~/code
	    ls -d $HOME/code/*/ | sed s:$HOME/code/:: | sed s:/::
	end
end
