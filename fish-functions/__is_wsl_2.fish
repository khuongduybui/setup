# Defined in /tmp/fish.jLXn3h/__is_wsl_2.fish @ line 1
function __is_wsl_2
	test (grep -e 'nameserver' /etc/resolve.conf | wc -l) = 1
end
