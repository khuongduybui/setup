function global:Environment-Init {
  Write-Verbose "Wrapping WSL."
  Wrap-WSL l accounts git
  Write-Verbose "Environment ready."
}
