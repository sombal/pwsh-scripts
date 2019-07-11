## Proxy Auth
$webclient=New-Object System.Net.WebClient

## Authenticate with existing login session
$webclient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

## Manual authentication
#$creds=Get-Credential -Message "Proxy Authentication Required" -UserName "itsh\h67968202"
#$webclient.Proxy.Credentials=$creds