# Defined in /tmp/fish.jyM7aG/code-sync.fish @ line 2
function code-sync
    cd ~/setup/code-sync

    if not test -d node_modules
        if type -q yarn
            yarn
        else if type -q npm
            npm install
        else if type -q pnpm
            pnpm install
        else
            echo "Install yarn, npm, or pnpm"
            return
        end
    end
    node .

    cd -
end
