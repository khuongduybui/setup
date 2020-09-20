# Defined in /tmp/fish.YZ2zuw/docker-init.fish @ line 2
function docker-init
    set -gx DOCKER_BUILDKIT 1
    find ~/.docker -empty -name config.json >/dev/null; and echo '{}' >~/.docker/config.json
    if ps aux | grep -q [d]ocker-desktop-proxy
    else
        info 'Launching Docker Desktop Proxy'
        nohup sudo /wsl/docker-desktop/docker-desktop-proxy --distro-name $WSL_DISTRO_NAME --docker-desktop-root /wsl/docker-desktop >(mktemp) &
    end
end
