$packageName = 'kubernetes-draft'
$packageVersion = $env:chocolateyPackageVersion
$toolsDir = Get-ToolsLocation
$draft_home = Join-Path $toolsDir "$packageName-$packageVersion"

Remove-Item $draft_home -Recurse -Force
