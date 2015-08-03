param($script);

if ($script -ne $null) {
    e "$(Split-Path $profile)\Scripts\$script.ps1";
} else {
    e "$(Split-Path $profile)";
}
