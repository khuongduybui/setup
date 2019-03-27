# Defined in /tmp/fish.3bZzv7/aps.fish @ line 2
function aps
	set -q BRAZIL_CLI_BIN
    or set -lx BRAZIL_CLI_BIN ~/.toolbox/bin
    set -lx SDE_CLI_BIN /apollo/env/SDETools/bin
    set -x BRAZIL_PLATFORM_OVERRIDE RHEL5_64

    getopts $argv | while read -l key value
        switch $key
            case legacy
                test -x $SDE_CLI_BIN/brazil; and set -x APS_PATH $SDE_CLI_BIN
            case exec
                set -x EXEC true
            case al2012
                set -x BRAZIL_PLATFORM_OVERRIDE AL2012
            case win
                set -x WIN true
        end
    end

    if test -z $APS_PATH
        test -x $BRAZIL_CLI_BIN/brazil; and set -x APS_PATH $BRAZIL_CLI_BIN
    end

	  set -lx ADDITIONAL_PATH
    if not test -z $WIN
        set -x ADDITIONAL_PATH $PATH
    else
        for v in $PATH
            if not __is_win_path $v
                set -x ADDITIONAL_PATH $ADDITIONAL_PATH $v
            end
        end
    end

    test -d /apollo/env/envImprovement
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/envImprovement/bin
    # test -d /apollo/env/AmazonAwsCli
    # and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/AmazonAwsCli/bin
    test -d /apollo/env/BarkCLI
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/BarkCLI/bin
    test -d /apollo/env/OdinTools
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/OdinTools/bin
    test -d /apollo/env/OctaneBrazilTools
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/OctaneBrazilTools/bin
    test -d /apollo/env/ApolloCommandLine
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/ApolloCommandLine/bin
    test -d /apollo/env/QuiltCLI
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/QuiltCLI/bin
    test -d /apollo/env/NodeJS
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/NodeJS/bin
    test -d /apollo/env/Sigv4Curl
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/Sigv4Curl/bin
    test -d /apollo/env/AAAWorkspaceSupport
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/AAAWorkspaceSupport/bin

    if not test -z $APS_PATH
        set -lx PATH $ADDITIONAL_PATH $APS_PATH
        
        if test -z $EXEC
            if __is_mac
                /usr/local/bin/fish
            else
                /usr/bin/fish
            end
        else
            if __is_mac
                exec /usr/local/bin/fish
            else
                exec /usr/bin/fish
            end
        end
    else
        echo "Cannot find `brazil` under $BRAZIL_CLI_BIN or $SDE_CLI_BIN"
        return -1
    end
end
