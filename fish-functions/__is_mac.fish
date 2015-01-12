function __is_mac
	return test (which sw_vers) >/dev/null 2>&1
end
