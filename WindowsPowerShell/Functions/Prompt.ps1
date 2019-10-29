function global:Prompt {
  $origLastExitCode = $LASTEXITCODE
  [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

  $wsl = Get-Command wsl -ErrorAction Ignore
  if ($wsl) {
    $prompt = "$(wsl starship prompt)"
    $prompt = $prompt -replace "^ ", "
"
    $prompt = $prompt -replace "🕙", "
🕙"
  } else {
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

    $timePrefix = "🕙 "
    $prompt += Write-Prompt $timePrefix
    $time = Get-Date -f "HH:mm:ss "
    $prompt += Write-Prompt $time -foregroundcolor DarkYellow

    $charPrefix = ""
    $prompt += Write-Prompt $charPrefix
    $char = "❯ "
    $prompt += Write-Prompt $char -foregroundcolor Green
  }

  $LASTEXITCODE = $origLastExitCode
  if ($prompt) { return $prompt } else { return " " }
}
