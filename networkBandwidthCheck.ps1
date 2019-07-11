﻿$timing = Measure-Command { (New-Object System.Net.WebClient).DownloadFile("http://nl.archive.ubuntu.com/ubuntu-cdimages/17.10/release/ubuntu-17.10-live-server-amd64.iso","d:\temp\testimage.iso") }
$size = 566

$speed = $size / $timing.Seconds
$speed = [Math]::Round($speed,2)
Write-Host "$speed MB/s"