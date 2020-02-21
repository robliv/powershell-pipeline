write-output "Running static tests!"
$ErrorActionPreference = "stop"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name PSScriptAnalyzer -force

    $analysis = Invoke-ScriptAnalyzer -Path ".\$($env:ModuleName)" -Settings PSGallery -Recurse


    if ($analysis){
        write-host "-----------`nPSScriptAnalyzer found some warnings/errors:"
        $analysis
        throw 
    }

}
catch {
    $error
    throw "Failed. Script exiting."
}
