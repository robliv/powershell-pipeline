write-output "Running static tests!"
$ErrorActionPreference = "stop"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name PSScriptAnalyzer

    $analysis = Invoke-ScriptAnalyzer -Path ".\$($env:ModuleName)" -Settings PSGallery -Recurse


    if ($analysis){
        $analysis
        throw "Failed static code analysis!"
    }

}
catch {
    $error
    write-output "Critical error in script. Exiting."
    $error.Clear()
}
