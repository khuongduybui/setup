# Defined in /tmp/fish.jyM7aG/code-sync.fish @ line 2
function code-sync
    cd ~/setup/code-sync

    if not test -d node_modules
        if which pnpm >/dev/null 2>&1
            pnpm install
        else if which npx >/dev/null 2>&1
            npx pnpm install
        else if which yarn >/dev/null 2>&1
            yarn
        else
            echo "Install npm, yarn, or pnpm"
            return
        end
    end
    node .

    cd -
end
