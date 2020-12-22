function __fish_command_not_found_on_interactive --on-event fish_prompt
    functions --erase __fish_command_not_found_handler
    functions --erase __fish_command_not_found_setup

    function __fish_command_not_found_handler --on-event fish_command_not_found
        if string match -q -r '^\.' $argv[1]
            set argv[1] (string replace -r '^.' '' $argv[1])
            if type -q npx
                and test -x ./node_modules/.bin/nps
                and test -e ./package-scripts.js
                npx --quiet nps --silent $argv
            else if type -q yarn
                yarn run --silent $argv
            else if type -q npm
                npm run --silent $argv
            else
                return 127
            end
        else
            if not type -q npx
                return 127
            end
            if string match -q -r @ $argv[1]
                npx $argv
            else if [ $argv[1] = "ncu" ]
                yarn upgrade-interactive --latest
            else
                npx --no-install $argv
            end
        end
    end

    functions --erase __fish_command_not_found_on_interactive
end
