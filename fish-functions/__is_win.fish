function __is_win
	grep -q -i "Microsoft" /proc/version
    and which wslpath >/dev/null 2>&1
end
