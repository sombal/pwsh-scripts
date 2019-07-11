$file = 'C:\Users\h67968202\OneDrive\Streaming\Shows\a.homok.titkai\sample.nfo'
$x = [xml] (Get-Content $file)
for ($i = 101; $i -le 180; $i++) {
    Select-Xml -xml $x -XPath /episodedetails |
        ForEach-Object { $_.Node.title = "Episode #1.$i"
            $_.Node.episode = "$i"
        }
    $outfile = "C:\Users\h67968202\OneDrive\Streaming\Shows\a.homok.titkai\s01\$i Rész.nfo"
    $x.Save($outfile)
}