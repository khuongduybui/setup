function wsbuild --argument sync
	if test -n "$sync"
		brazil ws sync --md
	end
	ws "brazil-build clean"
	ws "brazil-build"
end
