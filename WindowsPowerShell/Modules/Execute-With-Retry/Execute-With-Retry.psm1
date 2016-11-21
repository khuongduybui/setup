<#
This function can be used to pass a ScriptBlock (closure) to be executed and returned.

The operation retried a few times on failure, and if the maximum threshold is surpassed, the operation fails completely.

Params:
    Command         - The ScriptBlock to be executed
    RetryDelay      - Number (in seconds) to wait between retries
                      (default: 1)
    MaxRetries      - Number of times to retry before accepting failure
                      (default: 10)
Examples:

Execute-With-Retry { $connection.Open() }
$result = Execute-With-Retry -RetryDelay 1 -MaxRetries 2 { $command.ExecuteReader() }
#>
function Execute-With-Retry {
    [CmdletBinding()]
    param(
    [Parameter(ValueFromPipeline,Mandatory)]
    $Command,
    $RetryDelay = 1,
    $MaxRetries = 10
    )
    $currentRetry = 0
    $success = $false
    $cmd = $Command.ToString()
    do {
        try
        {
            $result = & $Command
            $success = $true
            Write-Verbose("Successfully executed [$cmd]")

            return $result
        }
        catch [System.Exception]
        {
            $currentRetry = $currentRetry + 1

            Write-Verbose("Failed to execute [$cmd]: " + $_.Exception.Message)

            if ($currentRetry -gt $MaxRetries) {
                throw "Could not execute [$cmd]. The error: " + $_.Exception.ToString()
            } else {
                Write-Verbose("Waiting $RetryDelay second(s) before attempt #$currentRetry of [$cmd]")
                Start-Sleep -s $RetryDelay
            }
        }
    } while (!$success);
}
