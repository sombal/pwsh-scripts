$ErrorActionPreference = "Continue"
$files = Get-Content -Path "C:\Users\basomogy\Downloads\list.txt"
$prefix = "https://www.raspberrypi.org/magpi-issues/"
$dest = "C:\Users\basomogy\Downloads\MagPi\"
$timing = Measure-Command {
    foreach ($file in $files) {
        $url = $prefix+$file
        $destfile = $dest+$file
        (New-Object System.Net.WebClient).DownloadFile("$url","$destfile")
        #Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $destfile
        Write-Host "." -NoNewline
    }
}
$timing
