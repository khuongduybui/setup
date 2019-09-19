function global:Prompt {
  $origLastExitCode = $LASTEXITCODE

  $prompt = "
"

  $locPrefix = ""
  $prompt += Write-Prompt $locPrefix
  $loc = $ExecutionContext.SessionState.Path.CurrentLocation.Path -replace ($HOME -replace "\\", "\\"), "~"
  if ($env:W) {
    $loc = $loc -replace ($env:W -replace "\\", "\\"), ""
  }
  $loc += " "
  $prompt += Write-Prompt $loc -foregroundcolor Cyan

  $prompt += "
"

  $timePrefix = "at 🕙 "
  $prompt += Write-Prompt $timePrefix
  $time = Get-Date -f "HH:mm:ss "
  $prompt += Write-Prompt $time -foregroundcolor DarkYellow

  $charPrefix = ""
  $prompt += Write-Prompt $charPrefix
  $char = "❯ "
  $prompt += Write-Prompt $char -foregroundcolor Green

  $LASTEXITCODE = $origLastExitCode
  if ($prompt) { return $prompt } else { return " " }
}
