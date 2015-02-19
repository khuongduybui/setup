param(
    [ValidateSet('start', 'stop', 'status', 'restart')] $action = 'status'
);

try {
    $solr = Get-Job -Name OpenfismaSolr -ErrorAction Stop;
    if ($action -eq "stop" -or $action -eq "restart") {
        Write-Host -NoNewline "Stopping Solr... " -ForegroundColor Yellow;
        Stop-Job $solr 2>&1 > $null;
        Remove-Job $solr 2>&1 > $null;
        Write-Host "done." -ForegroundColor DarkGreen;
    } else {
        Write-Host "Solr started." -ForegroundColor DarkGreen;
    }
    if ($action -eq "restart") {
        openfisma-solr start;
    }
} catch {
    if ($action -eq "start" -or $action -eq "restart") {
        Write-Host -NoNewline "Starting Solr... " -ForegroundColor Yellow;
        Start-Job -Name OpenfismaSolr -ScriptBlock {java -D"jetty.home"="C:\Users\Duy\code\openfisma\library\Solr" -D"solr.solr.home"="C:\Users\Duy\code\openfisma\library\Solr\solr" -D"solr.data.dir"="C:\Users\Duy\code\openfisma\library\Solr\solr\data" -D"jetty.port"=8983 -D"STOP.PORT"=8984 -D"STOP.KEY"=openfisma_solr -D"jetty.logs"="C:\Users\Duy\code\openfisma\library\Solr\logs" -jar "C:\Users\Duy\code\openfisma\library\Solr\start.jar" 2> "C:\Users\Duy\code\openfisma\data\logs\solr.log"} 2>&1 > $null;
        Write-Host "done." -ForegroundColor DarkGreen;
    } else {
        Write-Host "Solr stopped." -ForegroundColor DarkGreen;
    }
}
