function rails-runner
	cd rails-root
	ape /apollo/env/SDETools/bin/brazil-runtime-exec rails runner ../$argv[1]
	cd -
end
