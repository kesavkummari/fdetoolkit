$Endpoint = "http://localhost/health"
$TimeoutSeconds = 5

try {
    $Response = Invoke-WebRequest -Uri $Endpoint -TimeoutSec $TimeoutSeconds -UseBasicParsing -ErrorAction Stop
    if ($Response.StatusCode -eq 200) {
        Write-Host "OK: HTTPD is healthy (HTTP 200)"
        exit 0
    }
} catch {
    $Status = $_.Exception.Response.StatusCode.value__
    if ($Status) {
        Write-Error "CRITICAL: HTTPD returned status $Status"
    } else {
        Write-Error "CRITICAL: Unable to reach HTTPD service ($($_.Exception.Message))"
    }
    exit 1
}