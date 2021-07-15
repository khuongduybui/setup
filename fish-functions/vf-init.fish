function vf-init
    vf new -p (asdf which python) --connect (basename (dirname (pwd)))-(basename (pwd))
end
