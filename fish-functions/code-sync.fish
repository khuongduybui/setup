# Defined in /tmp/fish.jyM7aG/code-sync.fish @ line 2
function code-sync
    cd ~/setup/code-sync

    if not test -d node_modules
        if type -q pnpm
            pnpm install
        else if type -q npx
            npx pnpm install
        else if type -q yarn
            yarn
        else
            echo "Install npm, yarn, or pnpm"
            return
        end
    end
    node .

    cd -
end
