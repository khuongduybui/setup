if (Test-Path $env:ProgramFiles\Xming) {
  $env:DISPLAY="localhost:0"
}
