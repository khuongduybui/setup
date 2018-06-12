if [ -z "$ZSH_AUTO_RAN_FISH" ] && [ -x /usr/bin/fish ]; then
    export ZSH_AUTO_RAN_FISH=YES
    export SHELL=/usr/bin/fish
    exec /usr/bin/fish -l
fi
