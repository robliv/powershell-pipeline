write-output "Running static tests!"
$ErrorActionPreference = "stop"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201 –Force
    Install-Module -Name PSScriptAnalyzer

    $analysis = Invoke-ScriptAnalyzer -Path ".\$($env:ModuleName)" -Settings PSGallery -Recurse

    $analysis

    if ($analysis){
        $analysis
    }

}
catch {
    $error
}
