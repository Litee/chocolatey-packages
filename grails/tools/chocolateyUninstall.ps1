$packageName = 'grails'
$version = $env:chocolateyPackageVersion
$binRoot = Get-ToolsLocation
$grails_home = Join-Path $binRoot "$packageName-$version"

Install-ChocolateyEnvironmentVariable "GRAILS_HOME" $null 'Machine'

Remove-Item $grails_home -Recurse -Force

"Please manually remove Grails (%GRAILS_HOME\bin) from the PATH environment variable."