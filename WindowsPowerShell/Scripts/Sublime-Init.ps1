cd "$env:appdata\Sublime Text 3"
Invoke-WebRequest -URI "https://packagecontrol.io/Package Control.sublime-package" -OutFile "Installed Packages\Package Control.sublime-package"
mklink /D User "~/setup/sublime"
