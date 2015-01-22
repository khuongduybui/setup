function pwrake
	cd rails-root
	ape /apollo/env/SDETools/bin/brazil-runtime-exec rake $argv
	cd -
end
