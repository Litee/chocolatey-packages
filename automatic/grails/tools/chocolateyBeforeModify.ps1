$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$toolsDir = Get-ToolsLocation
$grails_home = Join-Path $toolsDir "$packageName-$packageVersion"

Remove-Item $grails_home -Recurse -Force
