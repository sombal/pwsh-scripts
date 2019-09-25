#Requires -RunAsAdministrator
# Install useful apps via Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Enable Choco Global Confirmation
Write-Output "Info -- Enabling global confirmation to streamline installs"
choco feature enable -n allowGlobalConfirmation
# Add Choco to default path
$testEnvPath = $Env:path
if (!($testEnvPath -contains "$env:ProgramData\chocolatey\bin")) {
    $Env:path = $env:path + ";$env:ProgramData\chocolatey\bin"
}