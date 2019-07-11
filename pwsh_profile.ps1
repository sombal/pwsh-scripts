#Start Transcript
function Start-Log {
    $logPath = "path-to-logfile"
    $transcriptDate = Get-Date -Format yyyyMMdd_HHmmss
    $transcriptPath = $logPath+"\"+$transcriptDate+".pslog"
    Start-Transcript -Path $transcriptPath | Out-Null
}
#Start-Log

#Change Prompt Text
function global:prompt {
    $now = Get-Date -format "HH:mm:ss"
    Write-Host "[$now] " -NoNewLine -ForegroundColor DarkGray
    Write-Host "..\$($pwd.Path.Split("\")[-1]) >" -NoNewLine -ForegroundColor Green
    return " "
}