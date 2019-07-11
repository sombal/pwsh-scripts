
# Write-Progress testing

# Counting items - percentage progress
$WinSxS = Get-ChildItem C:\Windows\WinSxS
$i = 1

$WinSxS | ForEach-Object {
    Write-Progress -Activity "Counting WinSxS file $($_.name)" -Status "File $i of $($WinSxS.Count)" -PercentComplete (($i / $WinSxS.Count) * 100)  
    $i++
}

# Sleep
Write-Progress -Activity "I'm going to sleep for 5 seconds" -Status "Zzzzz"  
Start-Sleep 5  
Write-Progress -Activity "Sleep" -Completed  
Start-Sleep 2  

# Sleep with countdown
For ($i=5; $i -gt 1; $i–-) {  
    Write-Progress -Activity "Launching rocket" -SecondsRemaining $i
    Start-Sleep 1
}

# Nested progress
Do{
    Write-Progress -Activity "$((get-date).hour) hours" -PercentComplete (((get-date).hour /23) * 100) -Status "$(24 - (get-date).hour) hours remaining"
    Do{
        Write-Progress -Id 1 -Activity "$((get-date).minute) minutes" -PercentComplete (((get-date).minute / 59) * 100) -Status "$(60 - (get-date).minute) minutes remaining" 
        Do{
            Write-Progress -Id 2 -Activity "$((get-date).second) seconds" -PercentComplete (((get-date).second / 59) * 100) -Status "$(60 - (get-date).second) seconds remaining" 
            Do{
                $Second = (Get-Date).second
                Write-Progress -Id 3 -Activity "$((get-date).millisecond) milliseconds" -Status "The time is $(get-date -f "HH:mm:ss")" -PercentComplete (((get-date).millisecond / 1000) * 100) -SecondsRemaining (86400 - (((get-date).hour * 60 * 60) + ((get-date).Minute * 60) + ((get-date).Second)))
                # start-sleep -Milliseconds 100
            }
            Until ((get-date).second -ne $Second)
        }
        Until ((get-date).second -eq 0)
    }
    Until ((get-date).minute -eq 0)
}
Until ((get-date).hour -eq 0)