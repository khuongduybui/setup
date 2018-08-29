function global:Prompt {
  $origLastExitCode = $LASTEXITCODE

  $prompt = ""

  if ($HasGit) {
    $prompt += Write-VcsStatus
  }

  $loc = $ExecutionContext.SessionState.Path.CurrentLocation.Path -replace ($HOME -replace "\\", "\\"), "~"
  $prompt += Write-Prompt " $loc " -BackgroundColor DarkGray
  $prompt += Write-Prompt "" -ForegroundColor DarkGray

  $LASTEXITCODE = $origLastExitCode
  if ($prompt) { return "$prompt " } else { return " " }
}
