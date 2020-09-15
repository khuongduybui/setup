# Defined in /tmp/fish.Ge6VN5/docker-init.fish @ line 2
function docker-init
    if ps aux | grep -q [d]ocker-desktop-proxy
    else
        info 'Launching Docker Desktop Proxy'
        nohup sudo /wsl/docker-desktop/docker-desktop-proxy --distro-name $WSL_DISTRO_NAME --docker-desktop-root /wsl/docker-desktop >(mktemp) &
    end
end
