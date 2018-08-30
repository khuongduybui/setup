function global:Prompt {
  $origLastExitCode = $LASTEXITCODE
  $oc = $host.ui.RawUI.ForegroundColor

  $prompt = ""
  $currentColor = [ConsoleColor]::DarkGray

  $loc = $ExecutionContext.SessionState.Path.CurrentLocation.Path -replace ($HOME -replace "\\", "\\"), "~"
  $prompt += Write-Prompt " $loc " -BackgroundColor $currentColor

  # $prompt += Write-VcsStatus
  if ($HasGit) {
    if ($GitStatus = Get-GitStatus -Force) {
      $newColor = if ($GitStatus.HasUntracked -or $GitStatus.HasWorking) {
        [ConsoleColor]::Red
      }
      else {
        if ($GitStatus.AheadBy -ne 0 -or $GitStatus.BehindBy -ne 0) {
          [ConsoleColor]::Magenta
        }
        else {
          [ConsoleColor]::Green
        }
      }
      $prompt += Write-Prompt "" -ForegroundColor $currentColor -BackgroundColor $newColor
      $branch = if ($GitStatus.Branch -ne "master" -and $GitStatus.Branch -ne "mainline") { " " + $GitStatus.Branch }
      $working = if ($GitStatus.HasWorking) { " " }
      $untracked = if ($GitStatus.HasUntracked) { " " }
      $ahead = if ($GitStatus.AheadBy -ne 0) { " " }
      $behind = if ($GitStatus.BehindBy -ne 0) { " " }
      $prompt += Write-Prompt " $branch $working$untracked$ahead$behind" -BackgroundColor $newColor
      $currentColor = $newColor
    }
  }

  $prompt += Write-Prompt " " -ForegroundColor $currentColor

  $time = Get-Date -f "yyyy-MM-dd HH:mm:ss"
  $rightPrompt += Write-Prompt $time -ForegroundColor Green
  $rightPromptLength += $time.length

  $x = $Host.UI.RawUI.windowsize.width - $rightPromptLength
  $y = $Host.UI.RawUI.CursorPosition.Y
  $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates $x,$y
  $Host.UI.Write($rightPrompt)
  $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0,$y

  $LASTEXITCODE = $origLastExitCode

  if ($prompt) { return $prompt } else { return " " }
}
