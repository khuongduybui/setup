# Defined in /tmp/fish.KINvyX/ada-refresh.fish @ line 2
function ada-refresh
  set -l AWSPROFILE $AWS_PROFILE
	if test -z $AWSPROFILE
	  if test (count $argv) = 1
			set -x AWSPROFILE $argv[1]
		else
			echo "AWS_PROFILE must be set. Consider calling ips"
			return
		end
	end

	if not test -e ~/.aws/config
		echo "~/.aws/config not found. Consider calling rsync-aws"
		return
	end

	if not grep -q ~/.aws/config -e $AWSPROFILE
		echo "Profile $AWSPROFILE not found in ~/.aws/config. Here are the list of available profiles:"
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

	echo '$ ada credentials update --once --profile='$AWSPROFILE' --provider=isengard --account='(cat ~/.aws/config | ini "profile $AWSPROFILE" "account")' --role='(cat ~/.aws/config | ini "profile $AWSPROFILE" "role")

	ada credentials update --once --profile=$AWSPROFILE --provider=isengard --account=(cat ~/.aws/config | ini "profile $AWSPROFILE" "account") --role=(cat ~/.aws/config | ini "profile $AWSPROFILE" "role")
end
