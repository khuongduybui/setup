# Defined in /tmp/fish.E2IYb6/code-sync.fish @ line 2
function code-sync
	cd ~/code
    for workspace in (ls | grep -v .code-workspace)
        echo -n "Syncing $workspace... "
        echo '{"folders":[' >"$workspace.code-workspace"
        if test -e "$workspace/packageInfo"
            echo '{"path": "'$workspace'"},' >>"$workspace.code-workspace"
        else
            for package in (ls "$workspace/")
                echo '{"path": "'$workspace"\\\\"$package'"},' >>"$workspace.code-workspace"
            end
        end
        echo ']}' >>"$workspace.code-workspace"
        echo 'done'
    end
    cd -
end
