param(
  [ValidateSet('None', 'Info', 'Warning', 'Error')] $icon = "None",
  [string] $title="Title",
  [string] $text="Message"
);

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");

$objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon;
$objNotifyIcon.Icon = "$(Split-Path $profile)\Resources\Sphax-PureBDcraftAether.ico";
$objNotifyIcon.BalloonTipIcon = $icon;
$objNotifyIcon.BalloonTipTitle = $title;
$objNotifyIcon.BalloonTipText = $text;
$objNotifyIcon.Visible = $True;
$objNotifyIcon.ShowBalloonTip(1000);

Beep;
