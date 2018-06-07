# Defined in /tmp/fish.1nX5GL/__is_amazon.fish @ line 2
function __is_amazon
	test (hostname -d | grep amazon.com)
end
