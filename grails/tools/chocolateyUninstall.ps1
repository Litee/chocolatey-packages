$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$toolsDir = Get-ToolsLocation
$grails_home = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyEnvironmentVariable "GRAILS_HOME" $null 'Machine'

Remove-Item $grails_home -Recurse -Force

"Please manually remove Grails (%GRAILS_HOME\bin) from the PATH environment variable."