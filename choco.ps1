# Prep workstations
Set-ExecutionPolicy -ExecutionPolicy ByPass -Scope Process

# Run some tests if internet access is available
$chocolateyNetTest = Test-NetConnection chocolatey.org -CommonTCPPort HTTP -InformationLevel Quiet
$azureNetTest = Test-NetConnection portal.azure.com -CommonTCPPort HTTP -InformationLevel Quiet
$gitHubNetTest = Test-NetConnection github.com -CommonTCPPort HTTP -InformationLevel Quiet

$validOnlineInstall = $false

if ($azureNetTest -and $gitHubNetTest -and $chocolateyNetTest) {
    Write-Output "Info -- All internet connectivity tests passed"
    $validOnlineInstall = $true
}
else {
    Write-Output "Error -- Internet connectivity issue. Exiting..."
    exit
}

# Deployment starts
if ($validOnlineInstall) {
    <#
    # Install Azure Powershell
    Write-Output "Info -- Installing Azure Powershell (Az module)"
    $azModule = Get-Module -Name Az -ListAvailable
    if (-not $azModule) {
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
        Install-Module -Name PowerShellGet -MinimumVersion 2.2.1 -Force
        Remove-Module -Name PowerShellGet
        Import-Module -Name PowerShellGet -MinimumVersion 2.2.1
        Set-PSRepository -Name PSGallery -SourceLocation "https://www.powershellgallery.com/api/v2" -InstallationPolicy Trusted
        Install-Module -Name Az -AllowClobber -Scope AllUsers
        Install-Module -Name AzureAD -AllowClobber -Scope AllUsers
    }
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
    # Visual Studio Code
    Write-Output "Info -- Installing VS Code"
    choco install vscode
    # Putty
    Write-Output "Info -- Installing Putty"
    choco install putty.install
    # Git
    Write-Output "Info -- Installing Git"
    choco install git
    # Chrome
    Write-Output "Info -- Installing Chrome"
    choco install googlechrome
    # Azure CLI
    Write-Output "Info -- Installing latest version of Azure CLI"
    choco install azure-cli
    # .NET Core SDK
    Write-Output "Info -- Installing latest version of .NET Core SDK"
    choco install dotnetcore-sdk
    # Powershell Core
    Write-Output "Info -- Installing latest version of Powershell Core"
    choco install powershell-core
    # Notepad++
    Write-Output "Info -- Installing latest version of Notepad++"
    choco install notepadplusplus
    # Postman
    Write-Output "Info -- Installing latest version of Postman"
    choco install postman
    # Fiddler
    Write-Output "Info -- Installing latest version of Fiddler"
    choco install fiddler
    # FSLogix Agent
    Write-Output "Info -- Installing latest version of FSLogix Agent"
    choco install fslogix
    # FSLogix Agent
    Write-Output "Info -- Installing latest version of Microsoft Teams"
    choco install microsoft-teams
    #>
    # Python
    Write-Output "Info -- Installing latest version of Python for Windows"
    choco install python3 --params "/InstallDir:C:\Python"
    refreshenv
    # Set Environment Variables
    [System.Environment]::SetEnvironmentVariable("PATH", "$env:Path;C:\Python;C:\Python\Scripts", "Machine")
    [System.Environment]::SetEnvironmentVariable("PATH", "$env:Path;C:\Python;C:\Python\Scripts", "User")
    # Set Current Session Variable
    $testEnvPath = $Env:path
    if (!($testEnvPath -contains "C:\Python;C:\Python\Scripts")) {
        $Env:path = $env:path + ";C:\Python;C:\Python\Scripts"
    }
    Write-Output "Info -- Upgrading pip"
    python -m ensurepip --default-pip
    python -m pip install -U pip
    refreshenv
    Write-Output "Info -- Installing certifi"
    pip install certifi
    Write-Output "Info -- Installing requests"
    pip install requests
}