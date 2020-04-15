function Start-Countdown {   
    param(
        $seconds,
        $message
    )
    ForEach ( $Count in (1..$Seconds) )
    {   Write-Progress -Id 1 -Activity $Message -Status "Visszaszámlálás: $($Seconds - $Count) másodperc" -PercentComplete ( ($Count / $Seconds) * 100 )
        Start-Sleep -Seconds 1
    }
    Write-Progress -Id 1 -Activity $Message -Status "Completed" -PercentComplete 100 -Completed
}
function Start-Game {
    Clear-Host
    $alph = @()
    65..90 | ForEach-Object { $alph += [char]$_ }
    $letter = $alph | Get-Random
    if ($letter -eq "Q" -or $letter -eq "W" -or $letter -eq "Y" -or $letter -eq "X") { Start-Game } else {
        Write-Host "A következő betű a(z): - $letter -"
        $string = "Jó lesz? Mehet? (i|n)"
        Write-Host $string
        while ( $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") ) {
            $char = $key.Character
            if (!($char -match '(^|,)(i|n)')) {
                Write-Host $string
            }
            else { break }
        }
        if ($char -eq "n") { Start-Game }
        elseif ($char -eq "i") {
            Clear-Host
            Start-Countdown -Seconds 120 -Message "Mehet a játék! A jelenlegi betű: - $letter -"
            $string = 'Lejárt az idő. Mégegy játék? (i|n)'
            Write-Host $string
            while ( $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") ) {
                $char = $key.Character
                if (!($char -match '(^|,)(i|n)')) {
                    Write-Host $string
                }
                else { break }
            }
            if ( $char -eq "n") {
                Write-Host "`nVége`n"
            }
            elseif ($char -eq "i") { Start-Game }
        }
    }
}
Start-Game