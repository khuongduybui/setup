function global:Environment-Init {
  Write-Verbose "Wrapping WSL."
  Wrap-WSL l accounts git ssh aws
  Write-Verbose "Environment ready."
}
