function pwrails
	cd rails-root
	ape /apollo/env/SDETools/bin/brazil-runtime-exec rails $argv
	cd -
end
