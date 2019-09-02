$ErrorActionPreference = "Continue"
$prefix = "https://www.raspberrypi.org/magpi-issues/"
$magpiIssues = Invoke-WebRequest -UseBasicParsing -Uri $prefix -Method GET
$fileList = $magpiIssues.Links | ForEach-Object {$_.href}
$dest = "$($env:userprofile)\Desktop\MagPi\"
$timing = Measure-Command {
    Write-Host "Downloading files" -NoNewline
    ForEach ($magFile in $fileList) {
        if ($magFile -like "*.pdf") {
            $url = $prefix+$magFile
            $destfile = $dest+$magFile
            (New-Object System.Net.WebClient).DownloadFile("$url","$destfile")
            Write-Host "." -NoNewline
        }
    }
}
$elapsed = [math]::Round($timing.TotalSeconds)
Write-Host `r`n"Download took $elapsed seconds"
