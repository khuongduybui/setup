# Defined in /tmp/fish.UhGFP6/code-sync.fish @ line 2
function code-sync
	cd ~/code
    for workspace in (ls | grep -v .code-workspace)
        echo -n "Syncing $workspace... "
        echo '{"folders":[' >"$workspace.code-workspace"

        if test -e "$workspace/packageInfo"
            echo '{"path": "'$workspace'"},' >>"$workspace.code-workspace"
        else
            for package in (ls "$workspace/")
                echo '{"path": "'$workspace/$package'"},' >>"$workspace.code-workspace"
            end
        end

        echo '],"settings":{' >>"$workspace.code-workspace"

        if __is_dev_desktop
            echo '"workbench.colorCustomizations": {' >>"$workspace.code-workspace"
            echo '    "activityBar.background": "#654057",' >>"$workspace.code-workspace"
            echo '    "activityBar.foreground": "#e7e7e7",' >>"$workspace.code-workspace"
            echo '    "activityBar.inactiveForeground": "#e7e7e799",' >>"$workspace.code-workspace"
            echo '    "activityBarBadge.background": "#11140c",' >>"$workspace.code-workspace"
            echo '    "activityBarBadge.foreground": "#e7e7e7",' >>"$workspace.code-workspace"
            echo '    "titleBar.activeBackground": "#462c3c",' >>"$workspace.code-workspace"
            echo '    "titleBar.inactiveBackground": "#462c3c99",' >>"$workspace.code-workspace"
            echo '    "titleBar.activeForeground": "#e7e7e7",' >>"$workspace.code-workspace"
            echo '    "titleBar.inactiveForeground": "#e7e7e799",' >>"$workspace.code-workspace"
            echo '    "statusBar.background": "#462c3c",' >>"$workspace.code-workspace"
            echo '    "statusBarItem.hoverBackground": "#654057",' >>"$workspace.code-workspace"
            echo '    "statusBar.foreground": "#e7e7e7"' >>"$workspace.code-workspace"
            echo '}' >>"$workspace.code-workspace"
        end

        echo '}}' >>"$workspace.code-workspace"
        echo 'done'
    end
    cd -
end
