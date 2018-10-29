function brazil-sync
	which toolbox >/dev/null 2>&1
    and toolbox update

    set -l here (pwd)
    cd ~/code
    for workspace in (ls | grep -v .code-workspace)
        if test -f $workspace/packageInfo
            set_color $fish_color_operator
            echo Updating $workspace
            set_color normal
            cd $workspace
            brazil ws sync
            cd -
        else
            set_color $fish_color_operator
            echo Skipping $workspace as packageInfo not found inside
            set_color normal
        end
    end
    cd $here
end
