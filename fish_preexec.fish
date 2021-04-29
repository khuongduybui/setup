function command_start_time --on-event fish_preexec
    test -n $STARSHIP_SESSION_KEY
    and echo -e "\e[1A🕙 "(date +%H:%M:%S)
end
