# Defined in /tmp/fish.9BGI3z/brazil-sync.fish @ line 2
function brazil-sync
	set -l here (pwd)
    cd ~/code
    for workspace in (ls | grep -v .code-workspace)
        echo Updating $workspace
        cd $workspace
        brazil ws sync
        cd -
    end
    cd $here
end
