$string = "Enter key [y|n]"
Write-Host $string
while ( $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") ) {
$char = $key.Character
if (!($char -match '(^|,)(y|n)')) {
   	Write-Host $string
   	}
  	else { break }
}
if ($char -eq 'y') { 
    Write-Host "[yes]" -ForegroundColor green
}
else { 
    Write-Host "[no]" -ForegroundColor red
}