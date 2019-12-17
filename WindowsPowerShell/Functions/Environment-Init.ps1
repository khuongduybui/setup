function global:Environment-Init {
  Write-Verbose "Wrapping WSL."
  Import-WslCommand accounts, aws, aws-console, docker, git, hub, l, ssh
  Write-Verbose "Environment ready."
}
