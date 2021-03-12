#Start Transcript
$logPath = "$env:USERPROFILE\Documents\Powershell\Logs"
$transcriptDate = Get-Date -Format yyyyMMdd
$transcriptPath = $logPath+"\"+"pwsh_transcript_"+$transcriptDate+".log"
Start-Transcript -Path $transcriptPath -Append | Out-Null

#Env setup
$repoPath = "D:\OneDrive\Profiles\Private\Sources"
$env:Path += ";C:\Program Files\Git\bin"
Set-Location $repoPath
Set-ExecutionPolicy -ExecutionPolicy ByPass -Scope Process

#Set cmd line prediction
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

#Set oh my posh prompt
Import-Module posh-git
Import-Module oh-my-posh

Set-PoshPrompt -Theme material

<#
#Change Prompt Text (old way)
function global:prompt {
    $now = Get-Date -format "HH:mm"
    Write-Host "[$now] " -NoNewLine -ForegroundColor DarkGray
    Write-Host "$env:USERNAME@$($env:COMPUTERNAME.ToLower()) " -NoNewLine -ForegroundColor Cyan
    Write-Host "..\$($pwd.Path.Split("\")[-1]) >" -NoNewLine -ForegroundColor Green
    return " "
}#>