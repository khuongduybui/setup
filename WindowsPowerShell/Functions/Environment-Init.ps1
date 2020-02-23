function global:Environment-Init {
  Write-Verbose "Wrapping WSL."
  Import-WslCommand accounts, aws, aws-console, git, hub, ips, l, ssh
  Write-Verbose "Environment ready."
}
