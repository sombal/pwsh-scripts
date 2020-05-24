function Start-Countdown {   
    param(
        $seconds,
        $message
    )
    foreach ( $count in (1..$seconds) ) {   
        Write-Progress -Id 1 -Activity $Message -Status "Visszaszámlálás: $($seconds - $count) másodperc" -PercentComplete ( ($Count / $Seconds) * 100 )
        Start-Sleep -Seconds 1
        if (($seconds - $count) -le 6 -and ($seconds - $count) -ne 0) {[console]::beep(1600,300)}
    }
    Write-Progress -Id 1 -Activity $Message -Status "Completed" -PercentComplete 100 -Completed
    [console]::beep(1600,300);./wsay.exe -v 6 -i ./orszagvaros.txt #[console]::beep(1600,1500)
}
function Start-Game {
    Clear-Host
    $alph = @()
    65..90 | ForEach-Object { $alph += [char]$_ }
    $letter = $alph | Get-Random
    if ($letter -eq "Q" -or $letter -eq "W" -or $letter -eq "Y" -or $letter -eq "X") { Start-Game } else {
        $letter = switch ($letter) {
            "A" {"A,Á"}
            "C" {"C,CS"}
            "D" {"D,DZ,DZS"}
            "E" {"E,É"}
            "G" {"G,GY"}
            "I" {"I,Í"}
            "J" {"J,LY"}
            "N" {"N,NY"}
            "O" {"O,Ó,Ö,Ő"}
            "S" {"S,SZ"}
            "T" {"T,TY"}
            "U" {"U,Ú,Ü,Ű"}
            "Z" {"Z,ZS"}
            Default {$letter}
        }
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
            $string = "Lejárt az idő. Mégegy játék? (i|n)"
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