param([switch] $v, [string] $program);

$path = "~/programs/$program*/bin"
echo $path
if ($v -eq $True) {
    Verify-Path -v $path
} else {
    Verify-Path $path
}
