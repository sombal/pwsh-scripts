function letter {
    Clear-Host
    $alph = @()
    65..90 | ForEach-Object { $alph += [char]$_ }
    $letter = $alph | Get-Random
    if ($letter -eq "Q" -or $letter -eq "W" -or $letter -eq "Y" -or $letter -eq "X") { letter } else {
        Write-Host "A következő betű a(z): " -NoNewline
        $string = 'Jó lesz? Mehet? (i|n)'
        Write-Host $letter -ForegroundColor Yellow -BackgroundColor Black
        Write-Host $string
        while ( $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") ) {
            $char = $key.Character
            if (!($char -match '(^|,)(i|n)')) {
                Write-Host $string
            }
            else { break }
        }
        if ($char -eq "n") { letter }
        elseif ($char -eq "i") {
            Clear-Host
            for ($i=130; $i -gt 1; $i–-) {  
                Write-Progress -Activity "Mehet a játék! A jelenlegi betű a(z): $letter" -SecondsRemaining $i
                Start-Sleep 1
            }
            Write-Host "`nVége`n"
        }
    }
}
letter