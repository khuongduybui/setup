# Defined in /tmp/fish.YZ2zuw/docker-init.fish @ line 2
function docker-init
    if type -q docker
        set -gx DOCKER_BUILDKIT 1
        find ~/.docker -empty -name config.json >/dev/null 2>&1; and echo '{}' >~/.docker/config.json
        if test -x /wsl/docker-desktop/docker-desktop-proxy; and not ps aux | grep -q [d]ocker-desktop-proxy
            info 'Launching Docker Desktop Proxy'
            nohup sudo /wsl/docker-desktop/docker-desktop-proxy --distro-name $WSL_DISTRO_NAME --docker-desktop-root /wsl/docker-desktop >(mktemp) 2>&1 &
        end
    end
end
