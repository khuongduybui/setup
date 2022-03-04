# Defined in /tmp/fish.eGjAyt/restore-code.fish @ line 2
function restore-code
    rsync --recursive --links ~/winhome/code/ ~/code/
end
