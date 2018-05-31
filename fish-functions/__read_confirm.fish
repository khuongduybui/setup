# Defined in /tmp/fish.RYYt16/__read_confirm.fish @ line 2
function __read_confirm
	set -l default n

	getopts $argv | while read -l key value
		switch $key
			case default
				set default $value
		end
	end

	switch (get --prompt="Do you want to continute? [y/n, default: $default]" --default=$default --rule=[yn] --no-case --silent=1)
		case y
			return 0
		case n
			return 1
	end
end
