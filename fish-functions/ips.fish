function ips
    set -lx AWS_PROFILE $argv[1]
    ada-refresh $argv[1]
    if __is_mac
        /usr/local/bin/fish
    else if __is_dev_desktop
        /apollo/env/envImprovement/bin/fish
    else
        /usr/bin/fish
    end
end
