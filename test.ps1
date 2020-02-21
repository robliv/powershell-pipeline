write-output "--------------`nRunning Pester tests!`n--------------`n"
$ErrorActionPreference = "stop"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name Pester -Force


}
catch {
    $error
    Write-Output "--------------`nCritical error was found. Exiting.--------------`n"
    exit 1
}
