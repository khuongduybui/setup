function global:Prompt {
  $origLastExitCode = $LASTEXITCODE

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

    $LASTEXITCODE = $origLastExitCode
    if ($prompt) { return $prompt } else { return " " }
  }
