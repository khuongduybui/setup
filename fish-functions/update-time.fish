# Defined in /tmp/fish.dUx8ys/update-time.fish @ line 1
function update-time
    type -q ntpdate; or sudo apt install ntpdate
    sudo ntpdate time.windows.com
end
