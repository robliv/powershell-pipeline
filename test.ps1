write-output "--------------`nRunning Pester tests!`n--------------`n"
$ErrorActionPreference = "stop"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201
    Install-Module -Name Pester -Force -SkipPublisherCheck
    Import-Module Pester
    Import-Module .\ExtractSCCM -force
    
    Invoke-Pester -OutputFile .\Test-Pester.XML -OutputFormat NUnitXML

}
catch {
    $error
    Write-Output "--------------`nCritical error was found. Exiting.--------------`n"
    exit 1
}
