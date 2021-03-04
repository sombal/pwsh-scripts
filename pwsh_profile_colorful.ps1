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

function prompt { 

    #Assign Windows Title Text
    $host.ui.RawUI.WindowTitle = "terminal ~"

    #Configure current user, current folder and date outputs
    $date = Get-Date -Format 'HH:mm:ss'

    # Test for Admin / Elevated
    $isAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    #Calculate execution time of last cmd and convert to milliseconds, seconds or minutes
    $lastCommand = Get-History -Count 1
    if ($lastCommand) { 
        $runTime = ($lastCommand.EndExecutionTime - $lastCommand.StartExecutionTime).TotalSeconds 
    }

    if ($runTime -ge 60) {
        $ts = [timespan]::fromseconds($runTime)
        $elapsedTime = ($ts.ToString("mm\:ss")).Split(":")
    }
    
    else {
        $elapsedTime = [math]::Round(($runTime), 2)
    }

    #Decorate the CMD Prompt
    Write-Host ""
    Write-Host " $date " -ForegroundColor Black -BackgroundColor DarkYellow -NoNewLine
    Write-host ($(if ($isAdmin) { ' Admin ' } else { '' })) -BackgroundColor DarkRed -ForegroundColor White -NoNewline 
    Write-Host " $env:COMPUTERNAME " -BackgroundColor DarkBlue -ForegroundColor White -NoNewline
    if ($pwd -like "*:*") {
        Write-Host " $pwd " -ForegroundColor White -BackgroundColor DarkGray 
    }
    else {
        Write-Host " .\$pwd\ " -ForegroundColor White -BackgroundColor DarkGray 
    }
    Write-Host "[ $($elapsedTime)s ]" -NoNewline -ForegroundColor DarkGray   
    return " > "

}