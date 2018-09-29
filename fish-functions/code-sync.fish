function code-sync
    cd ~/code
    for workspace in (ls | grep -v .code-workspace)
        echo -n Syncing $workspace...
        echo '{"folders":[' > $workspace.code-workspace
        for package in (ls $workspace/src)
            echo '{"path": "'$workspace'\\\\src\\\\'$package'"},' >> $workspace.code-workspace
        end
        echo ']}' >> $workspace.code-workspace
        echo done
    end
    cd -
end
