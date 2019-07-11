$wmi = Get-WmiObject -Class Win32_OperatingSystem
$uptime = ($wmi.ConvertToDateTime($wmi.LocalDateTime) - $wmi.ConvertToDateTime($wmi.LastBootUpTime))
Write-Host 'Host is up' $uptime.Days 'days,' $uptime.Hours 'hours,' $uptime.Minutes 'minutes,' $uptime.Seconds 'seconds'`n