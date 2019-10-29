function global:Environment-Init {
  Write-Verbose "Wrapping WSL."
  Import-WslCommand accounts, aws, docker, git, l, ssh
  Write-Verbose "Environment ready."
}
