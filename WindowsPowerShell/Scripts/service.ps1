param(
    [string] $keyword,
    [ValidateSet('start', 'stop', 'status', 'restart')] $action = 'status'
);

if ($keyword -eq "solr") {
    Openfisma-Solr $action;
# } elseif ($keyword -eq "redis") {
#     redis $action;
} else {
    if ($action -eq "status" -or $action -eq $null) {
        Get-Service -displayName $keyword;
    } elseif ($action -eq "start" -or $action -eq "restart") {
        Restart-Service -displayName $keyword;
    } elseif ($action -eq "stop") {
        Stop-Service -displayName $keyword;
    }
}
