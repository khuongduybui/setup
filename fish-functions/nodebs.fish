function nodebs
	set -x NODE_BINARY_PATH (which node)
	set -x NPM_BINARY_PATH (which npm)
	set -x I_WANT_NO_DEVTOOLS_SUPPORT_NOW_AND_FOREVER NODE_BINARY_PATH
end
