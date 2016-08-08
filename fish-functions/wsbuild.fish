function wsbuild
	brazil ws sync --md
	ws "brazil-build clean"
	ws "brazil-build"
end
