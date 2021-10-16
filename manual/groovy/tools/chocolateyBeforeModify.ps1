$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$toolsDir = Get-ToolsLocation
$groovy_home   = Join-Path $toolsDir "$packageName-$packageVersion"

Remove-Item $groovy_home -Recurse -Force
