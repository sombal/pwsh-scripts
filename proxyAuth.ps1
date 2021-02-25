## Proxy Auth
#$webclient=New-Object System.Net.WebClient

## Authenticate with existing login session
#$webclient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

## Manual authentication
#$creds=Get-Credential -Message "Proxy Authentication Required" -UserName "itsh\h67968202"
#$webclient.Proxy.Credentials=$creds

## Other Proxy
$username = "aht"
$password = ConvertTo-SecureString "MindenFasza69" -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $password)

$webclient = New-Object System.Net.WebProxy('https://10.220.40.138:3128')
$webclient.Credentials = $psCred
