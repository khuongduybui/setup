param($root);

if ($root -eq $nil) {
  $root = $SyncRoot;
}
Write-Verbose "- Using root: $root" -Verbose;

Push-Location;

if ((Test-Path $root\Essentials) -eq $True) {
  Write-Verbose "+ Linking dot files" -Verbose;
  Set-Location $root\Essentials;
  $files = Get-ChildItem -force | Where-Object {$_.NAME -match "^dotfile"};
  Set-Location ~;
  foreach ($file in $files) {
    $f = $file.Name -Replace "dotfile", "";

    if (Test-Path ~\$f) {
      # don't do anything
      Write-Verbose "| - Skipping existing $f" -Verbose;
    } else {
      if (($file.Attributes -match "Directory") -Or ($file.Attributes -match 524304)) {
        mklink /D $f $root\Essentials\$file;
      } else {
        mklink $f $root\Essentials\$file;
      }
    }
  }

  if ((Test-Path $root\Essentials\AppData) -eq $True) {
    Write-Verbose "+ Linking application data" -Verbose;
    Set-Location $root\Essentials\AppData;
    $files = Get-ChildItem;
    foreach ($file in $files) {
      $f = $file.Name;
      $syncApp = resolve-path $root\Essentials\AppData\$f;
      if (Test-Path $syncApp\where.txt) {
        Write-Verbose "| + Processing $(($syncApp -Split '\\')[-1])" -Verbose;
        $content = [IO.File]::ReadAllText($(Resolve-Path("$syncApp\where.txt")))
        if (Test-Path $content) {
          $local = Resolve-Path $content

          $children = Get-ChildItem -force $syncApp | Where-Object {$_.NAME -match "[^(^where.txt$)]"};
          Set-Location ~;
          foreach ($child in $children) {
            $file = $child.Name;

            if (Test-Path $local\$file) {
              if ($(Get-Item $(Resolve-Path $local\$file)).Attributes -band [IO.FileAttributes]::ReparsePoint) {
                Remove-Item -Force -Recurse $local\$file
              } else {
                Move-Item $local\$file $local\$file.bak
              }
            }

            if (Test-Path $local\$file) {
              # don't do anything
              Write-Verbose "| | - Skipping linked $file" -Verbose;
            } else {
              $target = Resolve-Path $syncApp\$file
              if ($child.Attributes -match "Directory") {
                mklink /D $local\$file $target;
              } else {
                mklink $local\$file $target;
              }
            }
          }
        } else {
          Write-Warning "| | - $content not found" -Verbose;
        }
      } else {
        Write-Verbose "| - Skipping $(($syncApp -Split '\\')[-1])" -Verbose;
        # don't do anything
      }
    }
  }
}

Write-Verbose "- Done with root: $root" -Verbose;
Pop-Location;
