$i = 1..10
foreach ($num in $i) {
    do {
      $Password =  -join(1..16|ForEach-Object{[char]((65..90) + (97..122) + (48..57) + (33,43,45,61,63,95) | Get-Random)})
    }
    until (($Password -cmatch "[a-z]") -and ($Password -cmatch "[A-Z]") -and ($Password -cmatch "[0-9]") -and ($Password -cmatch "[!,+,-,=,?,_]"))
    Write-Output "Password: $Password"
}
