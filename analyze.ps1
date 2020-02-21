write-output "Running static tests!"
$ErrorActionPreference = "stop"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201 –Force
    Install-Module -Name PSScriptAnalyzer

    $analysis = Invoke-ScriptAnalyzer -Path .\$($env:ModuleName) -Settings PSGallery -Recurse

    $analysis

    if ($analysis){
        $analysis
        Write-Output "Failed static code analysis!"
        Exit 12345
    }

}
catch {
    $error
    write-output "Critical error in script. Exiting."
    $error.Clear()
}
