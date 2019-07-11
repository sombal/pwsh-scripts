$url = 'http://google.com'

function tracktime {
    $timeTaken = Measure-Command -Expression {
        Invoke-WebRequest -Uri $url -UseBasicParsing | Out-Null
    }

    $milliseconds = $timeTaken.TotalMilliseconds

    $milliseconds = [Math]::Round($milliseconds, 0)
    write-host "$milliseconds ms loading $url"
    Start-Sleep 2
}

1..10 | ForEach-Object { tracktime }