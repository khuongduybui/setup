# Defined in /tmp/fish.cvyKJu/wps-init.fish @ line 2
function wps-init
	set_color $fish_color_operator; echo 'Bootstraping WPS Office'; set_color normal
    set apps et wpp wps
    for app in $apps
        if which $app >/dev/null 2>&1
            echo -n "checking $app... "
            if not ps aux | grep -v grep | grep -q "$app -quickstart"
                eval "$app -quickstart"
            end
            echo "done."
        end
    end
end
