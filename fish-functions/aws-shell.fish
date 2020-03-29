# Defined in /tmp/fish.f4j8jo/aws-shell.fish @ line 2
function aws-shell
  set -l profile $AWS_PROFILE
  if test (count $argv) -gt 0
      set -x profile $argv[1]
  end
  test -z $profile
  and set profile default
  echo Launching aws-shell with profile $profile
  docker run --rm -it -v "$HOME/.aws:/root/.aws" -e "AWS_PROFILE=$profile" hiroga/aws-shell:latest
end
