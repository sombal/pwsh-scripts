#Start Transcript
$logPath = "C:\Users\h67968202\OneDrive\Profiles\Work\Documents\Local\pwsh_transcripts"
$transcriptDate = Get-Date -Format yyyyMMdd_HHmmss
$transcriptPath = $logPath+"\"+$transcriptDate+".pslog"
Start-Transcript -Path $transcriptPath | Out-Null

#Change Prompt Text
function global:prompt {
    $now = Get-Date -format "HH:mm:ss"
    Write-Host "[$now] " -NoNewLine -ForegroundColor DarkGray
    Write-Host "..\$($pwd.Path.Split("\")[-1]) >" -NoNewLine -ForegroundColor Green
    return " "
}