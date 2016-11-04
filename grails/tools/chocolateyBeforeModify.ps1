$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$binRoot = Get-ToolsLocation
$grails_home = Join-Path $binRoot "$packageName-$version"

Remove-Item $grails_home -Recurse -Force
