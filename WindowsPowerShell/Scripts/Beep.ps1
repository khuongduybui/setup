$sound = New-Object System.Media.SoundPlayer;
$sound.SoundLocation="$(Split-Path $profile)\Resources\notify.wav";
$sound.Play();
