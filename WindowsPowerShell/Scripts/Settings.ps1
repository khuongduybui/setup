param($script);

if (Test-Path "$(Split-Path $profile)\Scripts\$script.ps1") {
    e "$(Split-Path $profile)\Scripts\$script.ps1";
} else {
    e "$profile";
}
