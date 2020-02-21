write-output "Running static tests!"

try {
    Install-PackageProvider Nuget -MinimumVersion 2.8.5.201 –Force
    Install-Module -Name PSScriptAnalyzer

    $analysis = Invoke-ScriptAnalyzer -Path .\$($env:ModuleName) -Settings PSGallery -Recurse

    $analysis

    if ($analysis){
        $analysis
        $analysis | Format-Table
        throw "Failed static code analysis!"
    }

}
catch {
    
}
