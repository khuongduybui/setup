# Defined in /tmp/fish.KINvyX/ada-refresh.fish @ line 2
function ada-refresh
	if test -z $AWS_PROFILE
		echo "AWS_PROFILE must be set. Consider calling ips"
		return
	end

	if not test -e ~/.aws/config
		echo "~/.aws/config not found. Consider calling rsync-aws"
		return
	end

	if not grep -q ~/.aws/config -e $AWS_PROFILE
		echo "Profile $AWS_PROFILE not found in ~/.aws/config. Here are the list of available profiles:"
		grep ~/.aws/config -e "profile"
		return
	end

	if not which ada >/dev/null 2>&1
		if not test -e ~/.toolbox/bin/ada
			echo "ada not found in PATH, nor in ~/.toolbox/bin. Consider calling toolbox install ada"
		else
			echo "ada not found in PATH. Consider calling aps"
		end
		return
	end

	echo '$ ada credentials update --once --profile='$AWS_PROFILE' --provider=isengard --account='(cat ~/.aws/config | ini "profile $AWS_PROFILE" "account")' --role='(cat ~/.aws/config | ini "profile $AWS_PROFILE" "role")

	ada credentials update --once --profile=$AWS_PROFILE --provider=isengard --account=(cat ~/.aws/config | ini "profile $AWS_PROFILE" "account") --role=(cat ~/.aws/config | ini "profile $AWS_PROFILE" "role")
end
