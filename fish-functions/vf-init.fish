# Defined in /tmp/fish.kKYJLI/vf-init.fish @ line 2
function vf-init
    vf new -p (which python) --connect (basename (dirname (pwd)))-(basename (pwd))
end
