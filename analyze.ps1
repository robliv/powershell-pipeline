write-output "--------------`nRunning static tests!`n--------------`n"
$ErrorActionPreference = "stop"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name PSScriptAnalyzer -force

    $analysis = Invoke-ScriptAnalyzer -Path ".\$($env:ModuleName)" -Settings PSGallery -Recurse


    if ($analysis){
        write-host "--------------`nPSScriptAnalyzer found some warnings/errors.`n--------------`n"
        $analysis
        exit 1
    }
    else{
        write-host "--------------`nPSScriptAnalyzer found no isses. Passed.`n--------------`n"
    }

}
catch {
    $error
    Write-Output "--------------`nCritical error was found. Exiting.--------------`n"
    exit 1
}
