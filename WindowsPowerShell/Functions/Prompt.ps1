function global:Prompt {
  $origLastExitCode = $LASTEXITCODE

  $loc = $ExecutionContext.SessionState.Path.CurrentLocation.Path -replace ($HOME -replace "\\", "\\"), "~"
  Write-Host " $loc " -BackgroundColor DarkGray -NoNewline
  Write-Host "" -ForegroundColor DarkGray -NoNewline

  $LASTEXITCODE = $origLastExitCode
  return ' '
}
