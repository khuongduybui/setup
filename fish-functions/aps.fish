# Defined in /tmp/fish.EGKyRY/aps.fish @ line 2
function aps
	set -lx ADDITIONAL_PATH $PATH
    test -d /apollo/env/envImprovement
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/envImprovement/bin
    test -d /apollo/env/AmazonAwsCli
    and set -lx ADDITIONAL_PATH $ADDITIONAL_PATH /apollo/env/AmazonAwsCli/bin
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

    set -q BRAZIL_CLI_BIN
    or set -lx BRAZIL_CLI_BIN ~/.toolbox/bin
    set -lx SDE_CLI_BIN /apollo/env/SDETools/bin

    getopts $argv | while read -l key value
        switch $key
            case legacy
                test -x $SDE_CLI_BIN/brazil
                and set -x APS_PATH $PATH $ADDITIONAL_PATH $SDE_CLI_BIN
        end
    end

    if test -n "$APS_PATH"
        test -x $BRAZIL_CLI_BIN/brazil
        and set -x APS_PATH $PATH $ADDITIONAL_PATH $BRAZIL_CLI_BIN
    end

    set -lx PATH $APS_PATH
    if test (which brazil 2>/dev/null)
        if __is_mac
            /usr/local/bin/fish
        else
            /usr/bin/fish
        end
    else
        echo "Cannot find `brazil` under $BRAZIL_CLI_BIN or $SDE_CLI_BIN"
        return -1
    end
end
