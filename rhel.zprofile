if [ -z "$ZSH_AUTO_RAN_FISH" ] && [ -x /apollo/env/envImprovement/bin/fish ]; then
    export ZSH_AUTO_RAN_FISH=YES
    export SHELL=/apollo/env/envImprovement/bin/fish
    exec /apollo/env/envImprovement/bin/fish -l
fi
