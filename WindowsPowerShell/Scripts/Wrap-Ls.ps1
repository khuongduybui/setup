New-CommandWrapper Out-Default -Process {
    $regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

    $compressed = New-Object System.Text.RegularExpressions.Regex(
        '\.(zip|tar|gz|rar|jar|war)$', $regex_opts)
    $executable = New-Object System.Text.RegularExpressions.Regex(
        '\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg|ahk|url)$', $regex_opts)
    $text_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(txt|text|cfg|conf|ini|csv|log|xml|java|c|cpp|cs)$', $regex_opts)
    $document_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(rtf|doc|docx)$', $regex_opts)
    $spreadsheet_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(csv|xls|xlsx)$', $regex_opts)
    $metadata_files = New-Object System.Text.RegularExpressions.Regex(
        '(\.(inf)$|^\.|\.sublime)', $regex_opts)
    $book_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(pdf|prc|mobi|epub|oxps|mht|cbz)$', $regex_opts)
    $audio_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(wma|flac|ogg|m4a|mp3)$', $regex_opts)
    $video_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(wmv|mkv|mp4|webm)$', $regex_opts)
    $image_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(jpg|jpeg|webp|gif|png)$', $regex_opts)

    if(($_ -is [System.IO.DirectoryInfo]) -or ($_ -is [System.IO.FileInfo]))
    {
        if(-not ($notfirst))
        {
           Write-Host
           Write-Host "    Directory: " -noNewLine
           Write-Host " $(pwd)`n" -foregroundcolor "Yellow"
           Write-Host "Mode                LastWriteTime     Length Name"
           Write-Host "----                -------------     ------ ----"
           $notfirst=$true
        }
        #Black, DarkBlue, Blue, DarkRed
        if ($_ -is [System.IO.DirectoryInfo]) {         Write-Color-LS "Yellow" $_          }
        elseif ($compressed.IsMatch($_.Name)) {         Write-Color-LS "DarkGreen" $_       }
        elseif ($executable.IsMatch($_.Name)) {         Write-Color-LS "Red" $_             }
        elseif ($text_files.IsMatch($_.Name)) {         Write-Color-LS "Gray" $_            }
        elseif ($document_files.IsMatch($_.Name)) {     Write-Color-LS "Cyan" $_            }
        elseif ($spreadsheet_files.IsMatch($_.Name)) {  Write-Color-LS "Green" $_           }
        elseif ($metadata_files.IsMatch($_.Name)) {     Write-Color-LS "DarkGray" $_        }
        elseif ($book_files.IsMatch($_.Name)) {         Write-Color-LS "DarkCyan" $_        }
        elseif ($audio_files.IsMatch($_.Name)) {        Write-Color-LS "DarkYellow" $_      }
        elseif ($video_files.IsMatch($_.Name)) {        Write-Color-LS "Magenta" $_         }
        elseif ($image_files.IsMatch($_.Name)) {        Write-Color-LS "DarkMagenta" $_     }
        else {                                          Write-Color-LS "White" $_           }

        $_ = $null
    }
} -end {
}
