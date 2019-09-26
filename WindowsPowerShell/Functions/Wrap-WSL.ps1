function global:Wrap-WSL {
  $args | ForEach-Object {
    Invoke-Expression @"
      Remove-Alias $_ -Force -ErrorAction Ignore
      function global:$_() {
        for (`$i = 0; `$i -lt `$args.Count; `$i++) {
            # If a path is absolute with a qualifier (e.g. C:), run it through wslpath to map it to the appropriate mount point.
            if (Split-Path `$args[`$i] -IsAbsolute -ErrorAction Ignore) {
                `$args[`$i] = Format-WslArgument (wsl.exe wslpath (`$args[`$i] -replace "\\", "/"))
            # If a path is relative, the current working directory will be translated to an appropriate mount point, so just format it.
            } elseif (Test-Path `$args[`$i] -ErrorAction Ignore) {
                `$args[`$i] = Format-WslArgument (`$args[`$i] -replace "\\", "/")
            }
        }

        if (`$input.MoveNext()) {
            `$input.Reset()
            `$input | wsl.exe $_ (`$args -split ' ')
        } else {
            wsl.exe $_ (`$args -split ' ')
        }
      }
"@
  }
}
