# Defined in /tmp/fish.ME9z40/turtle.fish @ line 2
function turtle
	set -l CURWD (pwd)
  set -l PWE (pwe)
  code turtle
  # brazil-build release
  env APOLLO_ACTUAL_ENVIRONMENT_ROOT=/apollo/env/SDETools sudo -E (brazil-path run.runtimefarm)/bin/python2.7 (brazil-path run.runtimefarm)/bin/turtle_register.py --config $CURWD/configuration/etc/turtle-config $PWE desktop $USER
  cd $CURWD
end
