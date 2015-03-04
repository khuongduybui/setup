Add-Type -AssemblyName System.Drawing

$exifTakenIndex  = 36867

# Define function to return "Date Picture Taken" EXIF Tag value
function Get-DateTaken($path) {
    $bmp = New-Object System.Drawing.Bitmap $path

    if($bmp.PropertyIdList.Contains(36867)){
        
        $prop = $bmp.GetPropertyItem($exifTakenIndex)
        $date = [System.Text.Encoding]::ASCII.GetString($prop.Value)
        [DateTime]::Parse($date.Substring(0,4) + "/" + $date.Substring(5,2) + "/" + $date.Substring(8))
    
    } else {
        [DateTime]::MinValue    
    }

    $bmp.Dispose()
}

$defaultSource = ((Split-Path -parent $MyInvocation.MyCommand.Definition) + "\")
$defaultDestination = ($defaultSource + "Imported\")

function Import-Images{
[CmdletBinding()]
param(
    [string]$SourceDir = $defaultSource,
    [string]$DestinationDir = $defaultDestination,
    [switch]$DontRemoveFilesAfterImport = $false
)

    $fullDestinationDirPath = [System.IO.Path]::GetFullPath($DestinationDir)

    dir -r $SourceDir *.jpg | where { !$_.FullName.Contains($fullDestinationDirPath) } | foreach {

        $dt = Get-DateTaken($_.FullName)
        $fdp = [System.IO.Path]::Combine($fullDestinationDirPath, ($dt.Year.ToString("0000") + "-" + $dt.Month.ToString("00") + "-" + $dt.Day.ToString("00")))

        if(!(Test-Path $fdp)){
            mkdir $fdp
        }

        $destinationFilePath = ""
        $counter = 1;

        do {
            
            $n = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)

            if(($counter -ge 2)){
                $n = ($n + " (" + $counter + ")" )
            }

            $destinationFilePath = [System.IO.Path]::Combine($fdp, ($n + $_.Extension))
            $counter = $counter + 1;

        } while(Test-Path ($destinationFilePath))

        if($DontRemoveFilesAfterImport){
            Copy-Item $_.FullName $destinationFilePath
        } else{
            Move-Item $_.FullName $destinationFilePath
        }
    }
<#
.Synopsis
    Imports images from the folder.
.Description 
    Imports images from the folder and store them into the taken date named subfolders.
.Parameter SourceDir
    Path to the directory the images will be imported from.
.Parameter DestinationDir
    Path to the directory the images will be imported to.
.Parameter DontRemoveFilesAfterImport
    Indicates that files should be copied (not moved) to the destination directory.
.Example
    # Import-Images

    Description
    -----------
    Imports all images recursively from the current folder to the .\Imported subfolder.
.Example
    # Import-Images -SourceDir:"C:\Camera" -DestinationDir:"C:\MyPics"

    Description
    -----------
    Imports all images recursively from the non-default folders.
.Example
    # Import-Images -DontRemoveFilesAfterImport

    Description
    -----------
    Imports all images and doesn't remove them from the source directory.
#>
}

Set-Alias ipimg Import-Images 
Export-ModuleMember -Function Import-Images -Alias *