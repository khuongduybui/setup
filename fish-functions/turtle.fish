# Defined in /tmp/fish.I3mO94/turtle.fish @ line 1
function turtle
	set -l PWD (pwd)
  set -l PWE (pwe)
  code turtle
  brazil-build release
  env APOLLO_ACTUAL_ENVIRONMENT_ROOT=/apollo/env/SDETools sudo -E (brazil-path run.runtimefarm)/bin/python2.7 (brazil-path run.runtimefarm)/bin/turtle_register.py --config $PWD/configuration/etc/turtle-config $PWE test $USER
  cd $PWD
end
